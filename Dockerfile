# Stage: Builder
FROM ruby:2.6.3-alpine as Builder

RUN apk add --update --no-cache \
    build-base \
    openssl \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    git \
    cmake \
    tzdata \
    libc6-compat \
    linux-headers

ENV APP_HOME /app

WORKDIR $APP_HOME

# Install gems
COPY Gemfile* $APP_HOME/
RUN CFLAGS="-Wno-cast-function-type" \
    BUNDLE_FORCE_RUBY_PLATFORM=1 \
    bundle install --jobs 20 --retry 5 \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete

COPY . $APP_HOME

# Stage: Final
FROM ruby:2.6.3-alpine

RUN apk add --update --no-cache \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    postgresql-client \
    file \
    tzdata \
    curl

ENV APP_USER app
ENV APP_HOME /app

# Add user
RUN addgroup -g 1000 -S $APP_USER  && adduser -u 1000 -S $APP_USER  -G $APP_USER

USER $APP_USER

# Copy app with gems from former build stage
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app $APP_HOME $APP_HOME

WORKDIR $APP_HOME

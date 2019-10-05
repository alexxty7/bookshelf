#!/bin/sh

set -e

bundle exec hanami db migrate

exec "$@"
# frozen_string_literal: true

%w[orders catalog accounts].each do |proto|
  proto_dir = File.join(Hanami.root, "apps/#{proto}/rpc")
  $LOAD_PATH.unshift(proto_dir) unless $LOAD_PATH.include?(proto_dir)
end

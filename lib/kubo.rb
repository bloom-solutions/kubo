require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/object/blank"
require "open3"
require "thor"
require "yaml"
require "kubo/version"

module Kubo
  class Error < StandardError; end
end

require "kubo/cli"
require "kubo/deploy"

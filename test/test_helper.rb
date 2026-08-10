# frozen_string_literal: true

# Load paths for local ask-rb gems (prefer local over installed gems)
ask_rb_root = File.expand_path("../..", __dir__)
%w[ask-core ask-tools ask-tools-shell ask-schema ask-skills ask-auth ask-instrumentation ask-llm-providers ask-agent ask-ruby-harness ask-mcp ask-sandbox-providers ask-state-providers].each do |gem|
  lib = File.join(ask_rb_root, gem, "lib")
  $LOAD_PATH.unshift lib if File.directory?(lib)
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "ask/ruby/mcp"

require "minitest/autorun"
require "mocha/minitest"

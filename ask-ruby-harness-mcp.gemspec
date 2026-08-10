# frozen_string_literal: true

require_relative "lib/ask/ruby/mcp/version"

Gem::Specification.new do |spec|
  spec.name = "ask-ruby-harness-mcp"
  spec.version = Ask::Ruby::MCP::VERSION
  spec.authors = ["Kaka Ruto"]
  spec.email = ["kaka@myrrlabs.com"]

  spec.summary = "MCP server for Ruby project introspection — exposes ask-ruby-harness tools over the Model Context Protocol"
  spec.description = <<~DESC
    Exposes the ask-ruby-harness tools (QueryDatabase, ReadModel, ReadLog,
    RunCommand, SchemaGraph, RunTests) as MCP tools for any Ruby project.
    Coding agents like Claude Code, Cursor, or any MCP-compatible client can
    connect to query the database, inspect models, read logs, run commands,
    and run tests with structured results.
  DESC

  spec.homepage = "https://github.com/ask-rb/ask-ruby-harness-mcp"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/ask-rb/ask-ruby-harness-mcp/blob/master/CHANGELOG.md"

  spec.files = Dir["lib/**/*", "bin/*", "LICENSE", "README.md", "CHANGELOG.md"]
  spec.bindir = "bin"
  spec.executables = ["ask-ruby-harness-mcp"]
  spec.require_paths = ["lib"]

  # >= 0.4.4 for the wrap_result fix: structured (Hash) tool results must be
  # JSON-serialized into valid MCP content.
  spec.add_dependency "ask-ruby-harness", ">= 0.1"
  spec.add_dependency "ask-mcp", ">= 0.4.4"

  spec.add_development_dependency "minitest", "~> 5.25"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "mocha", "~> 3.1"
end

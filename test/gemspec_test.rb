# frozen_string_literal: true

require_relative "test_helper"
require "rubygems/package"

class GemspecTest < Minitest::Test
  def setup
    @gemspec = Gem::Specification.load(File.expand_path("../ask-ruby-harness-mcp.gemspec", __dir__))
  end

  def test_gemspec_is_valid
    assert @gemspec, "gemspec should load"
  end

  def test_name_and_version
    assert_equal "ask-ruby-harness-mcp", @gemspec.name
    assert_equal Ask::Ruby::MCP::VERSION, @gemspec.version.to_s
  end

  def test_metadata_links
    assert_equal "https://github.com/ask-rb/ask-ruby-harness-mcp", @gemspec.homepage
    assert_equal @gemspec.homepage, @gemspec.metadata["source_code_uri"]
  end

  def test_executable_is_packaged
    assert_includes @gemspec.executables, "ask-ruby-harness-mcp"
    assert_includes @gemspec.files, "bin/ask-ruby-harness-mcp"
  end

  def test_all_lib_files_are_packaged
    Dir["lib/**/*.rb"].each do |f|
      assert_includes @gemspec.files, f, "#{f} should be in the packaged files"
    end
  end

  def test_no_rails_dependency
    deps = @gemspec.dependencies.map(&:name)
    refute_includes deps, "rails", "the generic MCP gem must not depend on Rails"
    refute_includes deps, "railties"
  end

  def test_depends_on_harness_and_mcp
    deps = @gemspec.dependencies.map(&:name)
    assert_includes deps, "ask-ruby-harness"
    assert_includes deps, "ask-mcp"
  end
end

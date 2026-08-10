# frozen_string_literal: true

require_relative "test_helper"

class VersionTest < Minitest::Test
  def test_version_is_set
    assert_match(/\A\d+\.\d+\.\d+\z/, Ask::Ruby::MCP::VERSION)
  end
end

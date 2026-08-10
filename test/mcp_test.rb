# frozen_string_literal: true

require_relative "test_helper"

class McpTest < Minitest::Test
  def setup
    Ask::Ruby::MCP.reset!
  end

  def test_tools_expose_the_full_harness_surface
    names = Ask::Ruby::MCP.tools.map(&:name)
    assert_equal %w[query_database read_log read_model run_command run_tests schema_graph].sort, names.sort
  end

  def test_tools_are_harness_tool_instances
    assert Ask::Ruby::MCP.tools.all? { |t| t.is_a?(Ask::Ruby::Harness::Tool) }
  end

  def test_tools_are_cached
    assert_same Ask::Ruby::MCP.tools, Ask::Ruby::MCP.tools
  end

  def test_reset_clears_the_cache
    first = Ask::Ruby::MCP.tools
    Ask::Ruby::MCP.reset!
    refute_same first, Ask::Ruby::MCP.tools
  end
end

# frozen_string_literal: true

require "ask/ruby/harness"
require "ask/mcp"
require_relative "mcp/version"

module Ask
  module Ruby
    module MCP
      PROTOCOL_VERSION = "2025-06-18"

      class << self
        # All ask-ruby-harness tools wrapped as MCP tool instances.
        def tools
          @tools ||= Ask::Ruby::Harness::HARNESS_TOOLS.map(&:new)
        end

        # Start the MCP stdio server, serving the project in the current
        # working directory (ask-ruby-harness's app_root).
        #
        #   $ ask-ruby-harness-mcp
        #
        # The server listens for JSON-RPC messages on stdin and writes
        # responses to stdout — the standard MCP stdio transport. Register
        # this executable as an MCP server in your client configuration:
        #
        #   "mcp": {
        #     "servers": {
        #       "ask-ruby-harness-mcp": {
        #         "type": "stdio",
        #         "command": "ask-ruby-harness-mcp",
        #         "args": []
        #       }
        #     }
        #   }
        def start
          Ask::MCP::Server.start_stdio(
            name: "ask-ruby-harness-mcp",
            version: VERSION,
            tools: tools,
            capabilities: { tools: {} },
            debug: ENV["DEBUG"] == "1"
          )
        end

        # Get or clear the cache (useful in tests).
        def reset!
          @tools = nil
        end
      end
    end
  end
end

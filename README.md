# Ask Ruby Harness MCP

MCP server exposing the [ask-ruby-harness](https://github.com/ask-rb/ask-ruby-harness)
tools over the Model Context Protocol — for **any Ruby project**.

| Tool | What it does |
|---|---|
| `query_database` | Read-only SQL (non-SELECT rejected; SELECT-only in production) |
| `read_model` | Inspect an ActiveRecord model's columns, associations, validations |
| `read_log` | Read log files with filtering and rotation support |
| `run_command` | Run shell commands, gated by permission rules |
| `schema_graph` | Full schema introspection: models, tables, columns, associations |
| `run_tests` | Structured test results with failure reruns (rails test / rspec / rake test) |

The server serves the project in its working directory — point your MCP
client at it from any Ruby project root (works in monorepos: `run_tests`
with a `file:` inside a subproject runs that project's suite).

## Usage

```
ask-ruby-harness-mcp
```

Register it as a stdio MCP server in your client (e.g. `~/.zcode/cli/config.json`
or a workspace `.zcode/config.json`):

```json
{
  "mcp": {
    "servers": {
      "ask-ruby-harness-mcp": {
        "type": "stdio",
        "command": "ask-ruby-harness-mcp",
        "cwd": "/path/to/your/ruby/project"
      }
    }
  }
}
```

## Development

```
bundle install
bundle exec rake test
```

## License

MIT — see LICENSE.

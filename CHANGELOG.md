## [0.1.0] — 2026-08-10

### Added

- **MCP server for any Ruby project** — `ask-ruby-harness-mcp` executable
  exposing the ask-ruby-harness tools (QueryDatabase, ReadModel, ReadLog,
  RunCommand, SchemaGraph, RunTests) over stdio. Serves the project in the
  current working directory; works in monorepos via `run_tests` subproject
  detection.

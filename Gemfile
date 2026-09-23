source "https://rubygems.org"

gemspec

# Local monorepo path gems for development (the gemspec dependency resolves
# from rubygems for consumers).
gem "ask-ruby-harness", path: "../ask-ruby-harness"
gem "ask-permissions", path: "../ask-permissions" if File.directory?("../ask-permissions")

group :test do
  gem "minitest", "~> 5.25"
  gem "rake", "~> 13.0"
end

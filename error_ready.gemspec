require_relative "lib/error_ready/version"

Gem::Specification.new do |spec|
  spec.name = "error_ready"
  spec.version = ErrorReady::VERSION
  spec.authors = ["Moses Gathuku"]
  spec.email = ["mosesgathuku95@gmail.com"]
  spec.homepage = "https://github.com/gathuku"
  spec.summary = "Summary of ErrorReady."
  spec.description = "Description of ErrorReady."
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gathuku"
  spec.metadata["changelog_uri"] = "https://github.com/gathuku"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0"
  spec.add_dependency "concurrent-ruby", "~> 1.1"

  spec.add_development_dependency "webmock"
  spec.add_development_dependency "debug"
end

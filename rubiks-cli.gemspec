require_relative "lib/rubiks_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "rubiks-cli"
  spec.version       = RubiksCli::VERSION
  spec.authors       = ["Noah Scott"]
  spec.email         = ["noah.scott.24@ucl.ac.uk"]
  
  spec.summary       = "A command-line Rubik's Cube timer"
  spec.description   = "A simple CLI tool for timing Rubik's Cube solves"
  spec.homepage      = "https://github.com/noahsc0tt/rubiks-cli"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z 2>/dev/null`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  
  spec.bindir        = "bin"
  spec.executables   = ["rubiks"]
  spec.require_paths = ["lib"]

  
end

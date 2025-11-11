require "bundler/gem_tasks"
require "rake/clean"

task :build do
  puts "Building gem..."
  system "gem build rubiks-cli.gemspec"
end

task :install => :build do
  puts "Installing gem..."
  system "gem install rubiks-cli-*.gem"
end

task :clean do
  puts "Cleaning up built gems..."
  system "rm -f *.gem"
end

task :release => [:clean, :build] do
  puts "Pushing to RubyGems..."
  system "gem push rubiks-cli-*.gem"
end
require 'rspec/core/rake_task'

desc "Run an IRB session with Pipeline pre-loaded"
task :console do
  exec "irb -I lib -r pipeline"
end

desc "Run the test suite"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
  t.rspec_opts = %w(--color --format documentation)
end

task :default => :spec

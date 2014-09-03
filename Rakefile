desc 'Run an IRB session with Pipeline pre-loaded'
task :console do
  exec 'irb -I lib -r pipeline'
end

unless %w(production staging integration).include?(ENV['PIPELINE_ENV'])
  require 'rspec/core/rake_task'
  desc 'Run the test suite'
  RSpec::Core::RakeTask.new(:spec)

  require 'rubocop/rake_task'
  desc 'Run RuboCop on the lib directory'
  RuboCop::RakeTask.new(:rubocop)

  task default: [:spec, :rubocop]
end

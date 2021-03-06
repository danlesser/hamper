require 'rake/clean'
require 'rake_n_bake'
CLEAN.include 'log/**'

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  puts 'Rubocop not available'
end

Rake::Task['default'].clear

task default: %i(
  bake:code_quality:all
  bake:code_quality:time_check
  rubocop
  rails_best_practices
  clean
  assets:clean
  bake:rspec
  bake:coverage:check_specs
  cucumber:all
  stats
  bake:ok_rainbow
)

task ci: %i(
  bake:code_quality:all
  bake:code_quality:time_check
  rubocop
  rails_best_practices
  clean
  assets:clean
  bake:rspec
  bake:coverage:check_specs
  travis
  stats
  bake:ok_rainbow
)

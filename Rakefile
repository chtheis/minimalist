# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# Looks we need that or 'Bundler' is an uninitialized constant
# See https://github.com/puppetlabs/pdk-templates/issues/139
require 'bundler'

require File.expand_path('../config/application', __FILE__)

Lists::Application.load_tasks

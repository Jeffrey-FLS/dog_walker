require 'bundler'
Bundler.require

connection_details = YAML::load(File.open('config/database.yml'))
require_all 'lib'
require_all 'app'
require 'active_record'
require 'yaml'
dbconf = YAML.load_file './db.yml'
ActiveRecord::Base.establish_connection(dbconf)

require 'sinatra/base'

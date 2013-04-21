require 'json'
require 'sinatra'
require './database.rb'
require './bitcoin.rb'
require './app.rb'
set :port, 80

run TestApplication

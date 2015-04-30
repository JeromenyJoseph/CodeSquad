require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'rack-flash'

set :database, "sqlite3:codersquad_db.sqlite3"
set :sessions, true
use Rack::Flash, sweep: true


require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'rack-flash'

set :database, "sqlite3:codersquad_db.sqlite3"
set :sessions, true
use Rack::Flash, sweep: true


get '/' do 
	erb :home
end

get '/signon' do
	erb :signon
end

get '/nav' do
	erb :nav
end
require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'rack-flash'

set :database, "sqlite3:codersquad_db.sqlite3"
set :sessions, true
use Rack::Flash, sweep: true


get '/profile' do
	erb :profile
end

get '/eprofile' do
	erb :eprofile
end

get '/' do 
	erb :home
end

get '/signon' do
	erb :signon
end

get '/nav' do
	erb :nav
end

get '/profile' do
	erb :profile
end

get '/eprofile' do
	erb :eprofile
end
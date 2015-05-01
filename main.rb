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

get '/signup' do
	erb :signup
end

post '/sign_up' do 
	new_user = User.create(params[:user])
	session[:user_id] = new_user.id
	flash[:notice] ="new user created"
	redirect to ('/')
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
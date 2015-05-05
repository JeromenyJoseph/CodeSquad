require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'rack-flash'

set :database, "sqlite3:codersquad_db.sqlite3"
set :sessions, true
use Rack::Flash, sweep: true


def current_user
	session[:user_id] ? User.find(session[:user_id]) : nil
end

def full_name
	"#{current_user.fname.capitalize} #{current_user.lname.capitalize}"
end

get '/profile' do
	@age = current_user.age
	puts params.inspect
	@location = current_user.location
	erb :profile
end

get '/eprofile' do
	erb :eprofile
end

get '/' do 
	erb :home
end

post '/signin' do
	@user = User.find_by_email(params[:email])
	if @user && @user.password == params[:password]
		flash[:notice] = "You've logged in"
		session[:user_id] = @user.id
		redirect to ('/profile')
	else
		flash[:notice] = "something is wrong..."
		redirect to ('/')
	end
end

get '/signup' do
	erb :signup
end

post '/sign_up' do 
	new_user = User.create(params[:user])
	session[:user_id] = new_user.id
	flash[:notice] ="Welcome #{new_user.fname}!"
	redirect to ('/profile')
end

post '/posting' do
	@post = Post.create(post: params[:post])
	current_user.posts << @post
	redirect to ('/profile')
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
require 'sinatra'
require 'json'
require "./model/db_model/db_connect"
require "./model/user_model/my_user_model"
# require "./controller/user.controller.rb"
enable :sessions

# connect to the database
ConnectionSQLite.connect 

# set the port and host
set :port, 8080
set :bind, '0.0.0.0'
set('views', './views')

# ==========POST============

# create a new user
post '/users' do
	User.create(params)
	return "User created"
end

# sign in a user with a username and password and a cookie
# validates user with email and password and then sets a cookie
post '/sign_in' do
	params['email']
	params['password']
	users = User.all
	user = users.find {|u| u.email == params['email'] and u.password == params['password']}
	if user
		puts "user is logged in"
		session[:user_id] = user.id
		return "User logged in"
	else
		return "User not found"
	end
end

# ============GET============

# get all user to display as hash
get '/users' do
	User.all.map { |user| user.to_hash.to_json }
end

# send a view index.html on the root request
get '/' do
	@users = User.all
	erb :index
end

# ============PUT============

# update a user's password
# update's user password by verifying user cookie and asks for a "new_password" field
put '/users' do
	puts "Updating password..."
	if session[:user_id]
		"Welcome back"
		if params[:new_password]
			id_ 		= session[:user_id]
			new_pass_ 	= params[:new_password]
			User.update(id_, "password", new_pass_)
			"Password Changed"
		else
			"Enter a new password with -d option"
		end
	else
		"Please login"
	end
end

# ============DELETE============

# sign out a user
# signs out the user by deleting the user cookie by checking user's email
delete '/sign_out' do
	params[:email]
	users = User.all
	user = users.find {|u| u.email == params[:email]}
	if user
		session[:user_id] = nil
		"User logged out"
	else
		"User not found"
	end
end

# delete a user
# delete's a specific user by grabbing user id
delete '/users' do
	User.destroy(params[:id])
end
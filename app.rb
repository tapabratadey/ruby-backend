require 'sinatra'
require 'json'
require "./model/db_model/db_connect"
require "./model/user_model/my_user_model"
enable :sessions

# connect to the database
ConnectionSQLite.connect 

# set the port and host
set :port, 8080
set :bind, '0.0.0.0'

# ==========POST============

# post a new user
post '/users' do
	User.create(params)
	return "User created"
end

post '/sign_in' do
	params['email']
	params['password']
	users = User.all
	user = users.map { 
		|user| user.email === params['email'] && user.password === params['password'] 
	}
	if user
		# session[:user_id] = user.id
		return "User logged in"
	else
		return "User not found"
	end
end

# ============GET============

# get all users
get '/users' do
	User.all.map { |user| user.to_hash.to_json }
end

# ============PUT============

put '/users' do
	User.create(params)
end

# ============DELETE============

delete '/sign_out' do
	
end

delete '/users' do
	
end
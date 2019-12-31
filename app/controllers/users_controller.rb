class UsersController < ApplicationController


get '/signup' do
  erb :'users/signup'
end

post '/signup' do
  user = User.new(params)
  if user.username.empty? || user.password.empty?
    @error = "You need a Username and Password before getting started"
    erb :'users/signup'
  elsif User.find_by(username: user.username)
    @error = "User already exists"
    erb :'users/signup'
  else
    user.save
    session[:user_id] = user.id
    redirect '/gears'
  end
end


end
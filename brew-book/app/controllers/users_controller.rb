class UsersController < ApplicationController

get "/signup" do
    @user=User.new
    erb :"/users/signup"
end

post "/signup" do
    @user = User.new(params[:user])
    if @user.save
        session[:user_id] = @user.id
        redirect "/"
    else
        @errors = @user.errors.full_messages
        erb :"/users/signup"
    end
end

get "/login" do
    @user=User.new
    erb :"/users/login"
end

post "/login" do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id]= @user.id
        redirect "/"
    else
        @user= User.new(params[:user])
        @errors = ["***Invalid Username and/or Password***"]
        erb :"/users/login"
    end
end

delete "/logout" do
    session[:user_id]=nil
    redirect "/"
end

end
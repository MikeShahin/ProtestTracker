class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if logged_in?
      erb :'users/dashboard'
    else
      redirect to '/login'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/protests'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirect to "/users/#{params[:username]}"
      redirect to "/dashboard"
    else 
      redirect to '/signup'
    end
  end

  post '/logout' do
    if logged_in?
        session.destroy
        redirect to '/'
    else
        redirect to '/'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'users/signup', locals: {message: "You gotta sign up for an account before posting"}
    else
      redirect to 'protests'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    elsif params[:username] == User.find_by(:username => params[:username]).username
      redirect to '/usernameerror'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect to '/protests'
    end
  end

  get '/usernameerror' do
    erb :'errors/usernameerror'
  end

  get '/dashboard' do
    @user = session[:user_id]
    if logged_in?
      # @protest = Protest.find_by(:user_id => @user.to_i)
      erb :'users/dashboard'
    else 
      redirect to '/login'
    end
  end
end

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
      flash[:alert] = "Logged in!"
      # redirect to "/users/#{params[:username]}"
      # redirect to "/dashboard"
      redirect to "/protests"

    else 
      flash[:error] = "Sorry, try again"
      redirect to '/login'
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
      erb :'users/signup'
    else
      redirect to 'protests'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == ""
      flash[:error] = "Please correctly fill out all fields."
      redirect to '/signup'
    elsif User.where(:username => params[:username]).exists?#params[:username] == User.find_by(:username => params[:username]).username
      flash[:error] = "Sorry, this name is already taken, please choose a different one"
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = @user.id
      redirect to '/protests'
    end
  end

  get '/dashboard' do
    @user = session[:user_id]
    if logged_in?
      erb :'users/dashboard'
    else 
      redirect to '/login'
    end
  end
end

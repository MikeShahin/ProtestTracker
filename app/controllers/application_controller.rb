require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "secret"
  end
  
  get "/" do
    @user = User.find_by(id: session[:user_id])
    erb :welcome
  end

  get '/index' do
    erb :index
  end

  get '/error' do
    erb :error
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end

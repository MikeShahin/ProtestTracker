class ProtestsController < ApplicationController

  get "/protests" do
    @protests = Protest.all
    erb :"/protests/show"
  end

  get "/protests/new" do
    if logged_in?
      erb :'protests/new_protest'
    else 
      redirect to '/login'
    end
  end

  post '/protests' do
    if logged_in?
      if params[:name] == "" || params[:location] == "" || params[:description] == "" || params[:date] == "" || params[:time] == ""
        redirect to '/protests/new'
      else
        @protest = current_user.protests.build(name: params[:name], location: params[:location], description: params[:description], date: params[:date], time: params[:time])
        if @protest.save
          redirect to '/protests'
        else
          redirect to '/protests/new'
        end
      end
    else
      redirect to 'login'
    end
  end

  
end

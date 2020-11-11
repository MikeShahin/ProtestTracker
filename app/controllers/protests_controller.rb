class ProtestsController < ApplicationController

  get "/protests" do
    @protests = Protest.all.sort_by {|p| p.date }
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
        flash[:error] = "Please fill out all the fields"
        redirect to '/protests/new'
      else
        @protest = current_user.protests.build(name: params[:name], location: params[:location], description: params[:description], date: params[:date], time: params[:time])
        if @protest.save
          redirect to "/protests/#{@protest.id}"
        else
          flash[:error] = "Sorry something went wrong! Try again"
          redirect to '/protests/new'
        end
      end
    else
      redirect to 'login'
    end
  end

  get '/protests/:id' do
    # if logged_in?
      @protest = Protest.find_by_id(params[:id])
      erb :'protests/show_protest'
    # else
    #   redirect to 'login'
    # end
  end

  get '/protests/:id/edit' do
    if logged_in?
      @protest = Protest.find_by_id(params[:id])
      if @protest && @protest.user == current_user
        erb :'protests/edit'
      else
        redirect to '/protests'
      end
    else
      redirect to '/login'
    end
  end

  patch '/protests/:id' do
    if logged_in?
      if params[:name] == "" || params[:location] == "" || params[:description] == "" || params[:date] == "" || params[:time] == ""
        flash[:error] = "Please fill out all fields"
        redirect to "/protests/#{params[:id]}/edit"
      else
        @protest = Protest.find_by_id(params[:id])
        if @protest && @protest.user == current_user
          if @protest.update(name: params[:name], location: params[:location], description: params[:description], date: params[:date], time: params[:time])
            redirect to "/protests/#{@protest.id}"
          else
            redirect to "/protests/#{@protest.id}/edit"
          end
        else
          redirect to '/protests'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/protests/:id/delete' do
    if logged_in?
      @protest = Protest.find_by_id(params[:id])
      if @protest && @protest.user == current_user
        @protest.delete
      end
      redirect to '/protests'
    else
      redirect to '/login'
    end
  end

end

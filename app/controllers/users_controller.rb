class UsersController < ApplicationController

  # GET: /users_controllers
  get "/users_controllers" do
    erb :"/users_controllers/index.html"
  end

  # GET: /users_controllers/new
  get "/users_controllers/new" do
    erb :"/users_controllers/new.html"
  end

  # POST: /users_controllers
  post "/users_controllers" do
    redirect "/users_controllers"
  end

  # GET: /users_controllers/5
  get "/users_controllers/:id" do
    erb :"/users_controllers/show.html"
  end

  # GET: /users_controllers/5/edit
  get "/users_controllers/:id/edit" do
    erb :"/users_controllers/edit.html"
  end

  # PATCH: /users_controllers/5
  patch "/users_controllers/:id" do
    redirect "/users_controllers/:id"
  end

  # DELETE: /users_controllers/5/delete
  delete "/users_controllers/:id/delete" do
    redirect "/users_controllers"
  end
end

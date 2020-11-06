class ProtestsController < ApplicationController

  # GET: /protests_controllers
  get "/protests_controllers" do
    erb :"/protests_controllers/index.html"
  end

  # GET: /protests_controllers/new
  get "/protests_controllers/new" do
    erb :"/protests_controllers/new.html"
  end

  # POST: /protests_controllers
  post "/protests_controllers" do
    redirect "/protests_controllers"
  end

  # GET: /protests_controllers/5
  get "/protests_controllers/:id" do
    erb :"/protests_controllers/show.html"
  end

  # GET: /protests_controllers/5/edit
  get "/protests_controllers/:id/edit" do
    erb :"/protests_controllers/edit.html"
  end

  # PATCH: /protests_controllers/5
  patch "/protests_controllers/:id" do
    redirect "/protests_controllers/:id"
  end

  # DELETE: /protests_controllers/5/delete
  delete "/protests_controllers/:id/delete" do
    redirect "/protests_controllers"
  end
end

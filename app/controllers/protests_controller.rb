class ProtestsController < ApplicationController

  get "/protests" do
    @protests = Protest.all
    erb :"/protests/show"
  end

end

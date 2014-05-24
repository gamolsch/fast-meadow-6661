class ApiController < ApplicationController

  def index
    render json: Item.all
  end

end

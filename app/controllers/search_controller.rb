class SearchController < ApplicationController

  # GET /items.json
  def index
    render json: Item.all
  end
end

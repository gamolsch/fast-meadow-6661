class SearchController < ApplicationController

  def main
    render "ng-search", layout: false
  end

  # GET /items.json
  def index
    render json: Item.all
  end
end

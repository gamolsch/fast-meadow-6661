class SearchController < ApplicationController
  before_action :set_item, only: [:destroy]

  def main
    render "ng-search", layout: false
  end

  # GET /items.json
  def index
    render json: Item.all
  end

  # POST /api/items.json
  def create
    puts "Processing!"
    @item = Item.new(item_params)

    if @item.save
      puts "Created!"
      render json: @item, status: :ok
    else
      puts "Error!"
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    puts "Destroying!"
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.permit(:name)
  end
end

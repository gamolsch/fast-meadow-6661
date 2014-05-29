class SearchController < ApplicationController
  before_action :set_item, only: [:destroy]

  def main
    render "ng-search", layout: false
  end

  # GET /items.json
  def index
    if params[:expired] == "true"
      render json: Item.expired.all
    else
      render json: Item.all
    end
  end

  # POST /api/items.json
  def create
    @item = Item.new(item_params)

    if @item.valid?

      # TODO: Add the Item to the given Storage (provided by User)

      p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      p params[:storage]
      p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

      storage = Storage.find_by(name: params[:storage])
      storage.add(item_params)

      #END TODO

      render json: @item, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    # TODO: Include all relevant parameters
    params.permit(:name, :manufacturer, :lot_number, :amount, :manufactured_on, :expired_on, :storage)
  end
end

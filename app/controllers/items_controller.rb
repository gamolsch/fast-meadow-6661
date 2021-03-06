class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @expired_percent = Item.expired_percent
    @almost_expired = Item.almost_expired_percent
    @not_pending_expired = Item.not_pending_expired
  end

  def ajaxget
    item = Item.find(params[:id])
    @item_info = {
      manufacturer: item.manufacturer,
      name: item.name,
      lot_number: item.lot_number,
      manufactured_on: item.manufactured_on,
      expired_on: item.expired_on,
      trans_info: []
    }

    # item.transactions do |trans|
    #   spec_trans_info = []
    #   binding.pry
    #   spec_trans_info << trans.how_long_ago
    #   spec_trans_info << trans.get_actor.first_name
    #   spec_trans_info << trans.get_actor.actor_last_name
    #   spec_trans_info << trans.action
    #   spec_trans_info << trans.get_item.name
    #   spec_trans_info << trans.storage.name
    #   @item_info.trans_info << spec_trans_info
    # end
    p @item_info
    respond_to do |format|
      format.json { render :json => @item_info}
    end

  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @remaining = Item.find(params[:id]).current_amount
  end

  # GET /items/new
  def new
    @item = Item.new
    @manuf = []
    Item.select(:manufacturer).distinct.reorder(:manufacturer).each do |manu|
      @manuf << manu.manufacturer
    end
  end

  # GET /items/1/edit
  def edit
    @current_amount = Item.current_amount(@item.id)
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    # Will have to have a way to get the category_id in the item
    respond_to do |format|
      if @item.save
        Transaction.create(user_id: 1, item_id: @item.id, action: "added", ammount_changed: params[:ammount_changed], storage_id: params[:storage])
        format.html { redirect_to @item, notice: 'Item was successfully added to inventory.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        Transaction.create(user_id: 1, item_id: @item.id, action: "updated", ammount_changed: params[:ammount_changed], storage_id: 1)
        # Will need to have item storage id as well, no way to get this without category implemented and available to the Item object.
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:manufacturer, :name, :lot_number, :manufactured_on, :expired_on, :unit_of_measure)
    end
end

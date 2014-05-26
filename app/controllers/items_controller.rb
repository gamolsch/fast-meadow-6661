class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @expired_percent = Item.expired_percent
    @almost_expired = Item.almost_expired_percent
    @not_pending_expired = Item.not_pending_expired
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @current_amount = Item.current_amount(@item.id)
    p "============================================="
    p @current_amount
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

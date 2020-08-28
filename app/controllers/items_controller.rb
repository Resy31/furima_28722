class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :describe, :price, :category_id, :delivery_fee_id, :ship_address_id, :ship_date_id, :status_id)
  end

end

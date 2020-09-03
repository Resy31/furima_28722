class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    return redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end

  end

  private

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :describe, :price, :category_id, :delivery_fee_id, :ship_address_id, :ship_date_id, :status_id, :image).merge(user_id: current_user.id)
  end
end

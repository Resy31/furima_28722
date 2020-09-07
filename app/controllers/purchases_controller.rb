class PurchasesController < ApplicationController
  before_action :move_to_session

  def index
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user.id
  end

  def create
  end

  private

  def move_to_session
    redirect_to user_session_path unless user_signed_in?
  end

end

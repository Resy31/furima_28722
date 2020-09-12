class PurchasesController < ApplicationController
  before_action :move_to_session

  def index
    @purchase = ItemPurchase.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
    redirect_to root_path unless @item.purchase.nil?
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_session
    redirect_to user_session_path unless user_signed_in?
  end

  def purchase_params
    params.require(:item_purchase).permit(:zip_code, :ship_address_id, :city, :house_number, :apartment, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                  # 通貨の種類(日本円)
    )
  end
end

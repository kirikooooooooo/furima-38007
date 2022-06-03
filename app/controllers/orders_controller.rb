class OrdersController < ApplicationController
  before_action :move_to_rootpath, only:[:index, :create]
  before_action :authenticate_user!, only:[:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_rootpath
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || Order.where(item_id: @item.id).exists?
      redirect_to root_path
    end
  end
end

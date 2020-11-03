class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]

  def index
    @order = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:postalcode_id, :prefecture_id, :city, :housenumber, :phonenumber, :building, :token, :item_id).merge(user_id: current_user.id)
  end

      def pay_item
        Payjp.api_key = ENV['PAYJP_SECRET_KEY']
        Payjp::Charge.create(
          amount: @item.price,
          card: order_params[:token],
          currency: 'jpy'
        )
      end
    def move_to_index
      @item = Item.find(params[:item_id])
       if @item.user_id == current_user.id || @item.order.present?
        redirect_to root_path
    end
  end
end

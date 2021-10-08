class OrdersController < ApplicationController
  before_action :authenticate_user!

	def index
	    @orders = Order.all 
	end

	def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to root_path
  end

  private
    def order_params
      params.require(:order).permit(:product_id, :quantity, :total, :user_id)
    end
end

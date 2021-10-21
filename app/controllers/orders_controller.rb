class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user_id: current_user.id)
    @orders = @orders.where(status: "cart")
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
 
  def edit
    @order = Order.find(params[:id])
  end

  def buy
    @order = Order.where(user_id: current_user.id)
    @order = @order.where(status: "cart")
    OrderMailer.with(order: @order, user_email: current_user.email).new_order_email.deliver_now 
    @orders = Order.where(user_id: current_user.id)  
    @orders.update(status: "sold")
    @orders.update(trashed: true)
    flash.alert = "Items Buy Successfully"
    redirect_to orders_path
  end

  def history
    @orders = Order.where(user_id: current_user.id)
    @orders = @orders.where(status: "sold")
    render 'history'
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to order
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private
    def order_params
      params.require(:order).permit(:product_id, :quantity, :total, :user_id, :status, :trashed)
    end
end

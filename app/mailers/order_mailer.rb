class OrderMailer < ApplicationMailer
  def new_order_email
    @orders = params[:order]
    user_email = params[:user_email]
    mail(to: user_email, subject: "Your order details")
  end
end

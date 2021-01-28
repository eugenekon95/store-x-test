class OrderMailer < ApplicationMailer
  def complete_order_email(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: 'Thank you for order!')
  end
end

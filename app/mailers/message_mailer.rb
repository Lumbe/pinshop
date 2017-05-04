class MessageMailer < ApplicationMailer
  default from: "PinShop <postmaster@mg.pinshop.com.ua>"

  def feedback(email, message)
    @email = email
    @message = message
    mail to: 'pin-shop@mail.ua',
        subject: 'Вопрос - ИМ Pin-Shop'
  end

  def new_order(email, order)
    @email = email
    @order = order
    mail to: 'pin-shop@mail.ua',
        subject: "Новый заказ"
  end
end

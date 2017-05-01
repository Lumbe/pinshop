class MessageMailer < ApplicationMailer
  default from: "Pin-Shop <pin-shop@mail.ua>"

  def feedback(email, message)
    @email = email
    @message = message
    mail from: email,
        to: 'pin-shop@mail.ua',
        subject: 'Вопрос - ИМ Pin-Shop'
  end

  def new_order(email, order)
    @email = email
    @order = order
    mail to: 'pin-shop@mail.ua',
        subject: "Новый заказ №#{@order.id}"
  end
end

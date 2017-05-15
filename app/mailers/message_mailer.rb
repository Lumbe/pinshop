class MessageMailer < ApplicationMailer
  default from: "PinShop <postmaster@mg.pinshop.com.ua>"

  def feedback(email, message)
    @email = email
    @message = message
    mail to: 'pin-shop@mail.ua',
        subject: 'Вопрос - ИМ Pin-Shop'
  end

  def self.order_notification(order)
    emails = User.find_each.map(&:email)

    emails.each do |email|
      order(email, order).deliver
    end
  end

  def order(email, order)
    @order = order
    user_id = User.find_by(email: email).id.to_s
    @token = @order.token + user_id
    mail to: email,
         subject: "Заказ №#{@order.id} - #{I18n.t("activerecord.attributes.order.statuses.#{@order.status}")}"
  end

end

class MessageMailer < ApplicationMailer
  default from: "Pin-Shop <pin-shop@mail.ua>"

  def send_mail(email, message)
    @email = email
    @message = message
    mail from: email,
        to: 'pin-shop@mail.ua',
        subject: 'Вопрос - ИМ Pin-Shop'
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
  def feedback
    MessageMailer.feedback('example@email.com', 'Lorem Ipsum - это текст-"рыба", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной "рыбой" для текстов на латинице с начала XVI века.')
  end
  def new_order
    MessageMailer.new_order('example@email.com', Order.last)
  end
end

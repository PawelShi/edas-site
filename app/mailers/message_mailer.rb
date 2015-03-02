class MessageMailer < ActionMailer::Base

  default from: "from@example.com",
  			template_path: 'mailers/message_mailer'

  def go_message(email)

  	mail(to: email, subject: 'Тестовое сообщение!')

  end

end

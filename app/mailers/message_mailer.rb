class MessageMailer < ApplicationMailer


  def new_message(message, user)
    @message = message
    @users = user
    
    mail(	to: user.email,
			subject: "GRUNE: Ważna wiadomość od administratora!"
		)
  end

end
class ContactMailer < ApplicationMailer


  def new_contact(contact, service)
    @contact = contact
    @service = service

    mail(	to: "rubyonrails666@gmail.com",
			subject: "GRUNE: Wiadomość od Użytkownika systemu!"
		)
  end

end
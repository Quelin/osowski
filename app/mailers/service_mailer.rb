class ServiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
	def new_service(user, service)
		@user = user
		@service = service

		mail(to: user.email,
			subject: "GRUNE: Nowe urządzenie!"
			)

	end


end

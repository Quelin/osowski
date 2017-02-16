class RemindMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
	def weekly(service)
		@service = service
		@user = User.find_by_id(@service.user_id)
		mail(to: @user.email,
			subject: "GRUNE: Przypomnienie!"
			)

	end


end


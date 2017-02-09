class PackageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
	def new_package(service, package)
		@package = package
		@service = @package.service
		@user = @package.user

		mail(to: @user.email,
			subject: "GRUNE: Nowa paczka instalacyjna dla urządzenia!"
			)

	end


end

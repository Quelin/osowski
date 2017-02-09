class InvoiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
	def new_invoice(service, invoice)
		@invoice = invoice
		@service = @invoice.service
		@user = @invoice.user

		mail(to: @user.email,
			subject: "GRUNE: Nowa faktura dla urządzenia!"
			)

	end


end

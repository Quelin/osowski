class InfoMailer < ApplicationMailer


  def new_info(info)
    @info = info

    mail(	to: @info.email,
			subject: "GRUNE: Ważna wiadomość od administratora!"
		)
  end

end
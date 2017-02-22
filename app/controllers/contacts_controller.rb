class ContactsController < ApplicationController

  def new
    @contact = Contact.new
   
  end

  def create
    
    @contact = Contact.new(contact_params)

    if params[:service].present?
      @service = Service.find(params[:service])
    else
    end


    if @contact.valid?
      ContactMailer.new_contact(@contact, @service).deliver
       redirect_to new_contact_path, :notice => "Twoja wiadomość została wysłana."
    else
      flash[:alert] = "Wystąpił błąd podczas wysyłania wiadomości."
      render :new
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :content, :nickname)
  end

end
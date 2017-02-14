class ContactsController < ApplicationController

  def new
    @contact = Contact.new
   
  end

  def create
    
    @contact = Contact.new(contact_params)

    @service = Service.find(params[:service])


    if @contact.valid?
      ContactMailer.new_contact(@contact, @service).deliver
       redirect_to new_contact_path, :notice => "Your message has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :content, :nickname)
  end

end
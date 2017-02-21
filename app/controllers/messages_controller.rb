class MessagesController < ApplicationController

 before_action :check_user, only: [:new, :create]

  def new
    @message = Message.new
    @users = User.all
  end

  def create
    @message = Message.new(message_params)
    @users = User.all
    
    if @message.valid?
      @users.each do |user|
        MessageMailer.new_message(@message, user).deliver
      end
      redirect_to new_message_path, notice: "Twoja wiadomość została wysłana."
    else
      flash[:alert] = "Wystąpił problem podczas wysyłania tej wiadomości."
      render :new
    end
  end

private

   def check_user
      unless current_user.admin?

        redirect_to users_path(current_user), :alert => "Niestety nie masz dostępu do tej podstrony systemu."

      end
    end

  def message_params
    params.require(:message).permit(:content, :nickname)
  end

end
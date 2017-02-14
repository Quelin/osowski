class InfosController < ApplicationController

  def new
    @info = Info.new
    @users = User.find(params[:id])
  end

  def create
    @info = Info.new(info_params)
    if @info.valid?
      InfoMailer.new_info(@info).deliver
       redirect_to users_path, :notice => "Your message has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def info_params
    params.require(:info).permit(:name, :email, :content, :nickname)
  end

end
class UsersController < ApplicationController

  before_action :check_user, only: [:edit, :new, :show, :create, :update, :delete, :destroy]

  	def index
      if current_user.admin?
  		@users = User.all
      @organization = User.organization
      @private_person = User.private_person
      else
        
      end
  	end
      def show
      @user = User.find(params[:id])
    end

    def delete
      @user = User.find(params[:id])
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "User was destroyed successfully"
      redirect_to(:action => 'index')
    end

    def new
      @user = User.new
      @user_count = User.count + 1
    end

    def create
      @user = User.new(user_params)

        if @user.save

          UserMailer.new_user(@user).deliver

          flash[:notice] = "User was created successfully"
          redirect_to user_path(@user)
        else
          @user_count = User.count + 1
          render('new')
        end
    end

    def edit
      @user = User.find(params[:id])
      @user_count = User.count
    end

    def update
    @user = User.find(params[:id])
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    params[:user].delete(:password)
    params[:user].delete(:password_confirmation)
    end
    if @user.update_attributes(user_params)
      redirect_to(:action => 'show', :id => @user.id)
    else
        render('edit')
        
    end
    end

  private

    def check_user
      unless current_user.admin?

        redirect_to users_path(current_user), :alert => "Niestety nie masz dostępu do tej podstrony systemu."

      end
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :lastname, :is_organization, :organization_name, :REGON, :NIP, :phone, :mobile_phone, :postcode, :street, :town, :admin, :description)
    end

end

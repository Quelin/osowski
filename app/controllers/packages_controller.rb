class PackagesController < ApplicationController
  before_action :set_package, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :new, :show, :create, :update, :delete, :destroy]


  def index
    if current_user.admin?
    @service = Service.find(params[:service_id])
    @packages = @service.packages.order(created_at: :desc)
    else

      @packages = current_user.packages.order(created_at: :desc)

    end
  end


  def new
    @service = Service.find(params[:service_id])
    @package = @service.packages.build
  end

  def edit
    @service = Service.find(params[:service_id])
    @package = @service.packages.find(params[:id])
  end

  def show

  end
 
  def create
    @service = Service.find(params[:service_id])
    @package = @service.packages.create(package_params)

    respond_to do |format|
      if @package.save

        PackageMailer.new_package(@service, @package).deliver


        format.html { redirect_to service_packages_url, location: [@package.service, @package], notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: [@package.service, @package] }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end


  def update

    @service = Service.find(params[:service_id])
    @package = @service.packages.find(params[:id])

    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to service_packages_url, location: [@package.service, @package], notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: [@package.service, @package] }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @service = Service.find(params[:service_id])
    @package = @service.packages.find(params[:id])
    @package.destroy
    respond_to do |format|
      format.html { redirect_to service_packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def check_user
      unless current_user.admin?

        redirect_to service_packages_path(current_user), :alert => "Niestety nie masz dostępu do tej podstrony systemu."

      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:name, :link, :description, :service_id, :user_id)
    end
end

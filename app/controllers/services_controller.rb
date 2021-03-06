class ServicesController < ApplicationController
  before_action :set_service, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :new, :create, :update, :delete, :destroy, :index_all]

  def index_all

      @services = Service.all

  end

  # GET /services
  # GET /services.json
  def index
    if current_user.admin?
    user = User.find(params[:user_id])
    @services = user.services
    @calendar_services = @services.where.not(start_date: nil)
    else
    @services = current_user.services
    @calendar_services = @services.where.not(start_date: nil)
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    if current_user.admin?
    user = User.find(params[:user_id])
    @service = user.services.find(params[:id])
    else
    @service = current_user.services.find(params[:id])
    end
  end

  # GET /services/new
  def new
    user = User.find(params[:user_id])
    @service = user.services.build
  end

  # GET /services/1/edit
  def edit
    user = User.find(params[:user_id])
    @service = user.services.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    user = User.find(params[:user_id])
    @service = user.services.create(service_params)

    respond_to do |format|
      if @service.save
        
        ServiceMailer.new_service(user, @service).deliver

        format.html { redirect_to [@service.user, @service], notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: [@service.user, @service] }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update

    user = User.find(params[:user_id])
    @service = user.services.find(params[:id])


    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to [@service.user, @service], notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    user = User.find(params[:user_id])
    @service = user.services.find(params[:id])
    @service.destroy
    respond_to do |format|
      format.html { redirect_to user_services_url, notice: 'Service was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private
    def check_user
      unless current_user.admin?

        redirect_to user_services_path(current_user), :alert => "Niestety nie masz dostępu do tej podstrony systemu."

      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :description, :owner_of_equipment, :is_serviced, :start_date, :end_date, :user_id, components_attributes: [:id, :name, :serial_number, :description, :_destroy])
    end
end

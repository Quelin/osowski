class InstructionsController < ApplicationController
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :new, :show, :create, :update, :delete, :destroy]


  # GET /instructions
  # GET /instructions.json
  def index
    if current_user.admin?
    user = User.find(params[:user_id])
    @instructions = user.instructions.order(created_at: :desc)
      else

      @instructions = current_user.instructions.order(created_at: :desc)

    end
  end

  # GET /instructions/1
  # GET /instructions/1.json
  def show
  end

  # GET /instructions/new
  def new
    user = User.find(params[:user_id])
    @instruction = user.instructions.build
  end

  # GET /instructions/1/edit
  def edit
    user = User.find(params[:user_id])
    @instruction = user.instructions.find(params[:id])
  end

  # POST /instructions
  # POST /instructions.json
  def create
    user = User.find(params[:user_id])
    @instruction = user.instructions.create(instruction_params)

    respond_to do |format|
      if @instruction.save
        
        # InstructionMailer.new_instruction(user, @instruction).deliver

        format.html { redirect_to user_instructions_url, notice: 'instruction was successfully created.' }
        format.json { render :show, status: :created, location: [@instruction.user, @instruction] }
      else
        format.html { render :new }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructions/1
  # PATCH/PUT /instructions/1.json
  def update

    user = User.find(params[:user_id])
    @instruction = user.instructions.find(params[:id])


    respond_to do |format|
      if @instruction.update(instruction_params)
        format.html { redirect_to user_instructions_url, notice: 'instruction was successfully updated.' }
        format.json { render :show, status: :ok, location: @instruction }
      else
        format.html { render :edit }
        format.json { render json: @instruction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructions/1
  # DELETE /instructions/1.json
  def destroy
    user = User.find(params[:user_id])
    @instruction = user.instructions.find(params[:id])
    @instruction.destroy
    respond_to do |format|
      format.html { redirect_to user_instructions_url, notice: 'instruction was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

    def check_user
      unless current_user.admin?

        redirect_to user_instructions_path(current_user), :alert => "Niestety nie masz dostępu do tej podstrony systemu."

      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_instruction
      @instruction = Instruction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instruction_params
      params.require(:instruction).permit(:name, :description, :link, :user_id)
    end
end

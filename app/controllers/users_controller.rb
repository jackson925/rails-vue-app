class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]

  # GET /user/authenticate
  def authenticate
  end
  
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/reset
  def reset
    # @user = User.new
  end

  # GET /users/login
  def login
    # @user = User.new
  end

  # GET /users/new
  def new
    @user = User.new({})
  end

  # GET /users/register
  def register 
  end


  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    logger.info "logging incoming request..."
    logger.info user_params
    @user = User.new user_params


    logger.info @user.attributes

    respond_to do |format|
      if @user.save
          format.html { redirect_to "users/registration_success", notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
      else
        logger.debug @user.save!

        format.html { render :reset, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      logger.debug "user attributes: #{@user.attributes.inspect}"
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :company_name, :customer_type, :estimated_annual_projects, :estimated_annual_products, :agree)
    end
end

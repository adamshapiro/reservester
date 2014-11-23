class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :role_change]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def dashboard
    if logged_in?
      @user = current_user
    else
      flash[:alert] = "You must be logged in to view the dashboard."
      redirect_to login_path
    end
  end

  def role_change

    if @user == current_user
      if @user.role == 'patron'
        @user.role = 'owner'
        @user.save!
      elsif @user.role == 'owner'
        @user.role = 'patron'
        @user.save!
      end
      redirect_to user_path @user
    end

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = user_params[:password]

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        log_in @user
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_digest, :role)
    end
end
class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update approve decline reject destroy ]
  
  # GET /dummies or /dummies.json
  def index
    unless current_user.role == 'admin' || current_user.role == 'faculty'
      redirect_to flipbooks_path
    end

    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    @users = @users.where(role: params[:role]) if params[:role].present?
    @users = @users.where.not(confirmed_at: nil)
    @users = @users.order(approved: :asc, created_at: :desc)
    @roles = { "" => "", "Admin" => "admin", "Faculty" => "faculty", "Student" => "student" }

    if params[:q].nil?
      @selected_role = ''
    else
      @selected_role = params[:q][:role_cont]
    end
  end

  # GET /dummies/1 or /dummies/1.json
  def show
  end

  # GET /dummies/new
  def new
    @user = User.new
  end

  # GET /dummies/1/edit
  def edit
  end

  # POST /dummies or /dummies.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dummies/1 or /dummies/1.json
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

  # DELETE /dummies/1 or /dummies/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # APPROVE
  def approve
    @user.approved = true
    @user.save

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully approved." }
      format.json { head :no_content }
    end
  end

  # DECLINE
  def decline
    @user.approved = false
    @user.save

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully declined." }
      format.json { head :no_content }
    end
  end

  # REJECT
  def reject
    @user.rejected = !@user.rejected
    @user.save

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully rejected." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :role, :first_name, :last_name, :student_id, :middle_name, :employee_id, :confirmed)
      # params.fetch(:user, {})
    end
end

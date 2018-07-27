class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show

  end

  def edit

  end

  def index
    puts 'index ------------'
    @users = User.all
  end

  def destroy
    puts 'destroy-----------'
    user_name = @user.name

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User #{user_name} was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash[:danger] = 'User name already exist. Choose another one.'
      redirect_to '/signup'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    puts 'set_user-------------'
    @user = User.find(params[:id])

  end

  def user_params
    params.require(:user).permit(:name, :access, :email, :password, :password_confirmation, :admin)
  end
end

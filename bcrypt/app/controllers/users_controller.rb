class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    if current_user.nil?
      redirect_to root_path, notice: "You need to be logged in to see this page."
    else
      @user = User.new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up"
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:admin, :name, :email, :password, :password_confirmation)
  end

end
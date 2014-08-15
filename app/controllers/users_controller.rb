class UsersController < ApplicationController

  def new
    if signed_in?
      redirect_to users_url
    end
  end

  def create
    if signed_in?
      redirect_to users_url
    else
      @user = User.new(user_params)

      if @user.save
        sign_in!(@user)
        redirect_to users_url
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
    end
  end

  def update
  end

  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :lat, :lng)
  end
end

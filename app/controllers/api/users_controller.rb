module Api
  class UsersController < ApplicationController
    def create
      @user = user.new(user_params)

      if @user.save
        render json: @user
      else
        flash[:notice] = "Invalid user! Please Try Again"
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @users = User.all
      @user = User.find(params[:id])
      @current_user = @user
      render :show

    end

    def index
      @users = User.all
      @current_user = current_user
      user_token = session[:session_token]
      @user = current_user
      render :index
    end

    def edit
      @user = User.find(params[:id])
      render :edit
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render :json => @user
      else
        render :json => @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @user = user.find(params[:id])
      @user.destroy
      render :json => {}
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :lat, :lng)
    end
  end
end

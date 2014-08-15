class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to users_url
    end
  end

  def create
    if current_user
      redirect_to users_url
    else
      @user = User.find_by_credentials(params[:user])

      if @user
        sign_in!(@user)
        @user.update(lat: params[:user][:lat])
        @user.update(lng: params[:user][:lng])
        redirect_to users_url
      else
        flash.now[:errors] = ["Invalid email and/or password"]
        render :new
      end
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:email, :password, :lat, :lng)
  end
end

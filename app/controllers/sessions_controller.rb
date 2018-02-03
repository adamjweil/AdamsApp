class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      render json: { message: "the session create failed, you are stupid, roman said so....." }
    end
  end

  def delete
    session.clear
    redirect_to "/"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

require 'Nokogiri'
require 'HTTParty'

class ApplicationController < ActionController::Base

  def create_user
    @user = User.new(params[:user])
    @user.password = params[:user][:password]
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/"
      else
        status 422
        @errors = @user.errors.full_messages
      end
  end
  helper_method :create_user

  def login
    user = User.authenticate(params[:user][:email], params[:user][:password_digest])
      if user
        session[:user_id] = user.id
        redirect_to "/"
     else
       status 422
        @errors = ["Login Attempt Failed."]
        redirect_to '/sessions/new'
      end
  end
  helper_method :login

  def logged_in?
    !!@current_user
  end
  helper_method :logged_in?

  def find_user
    if session[:user_id]
      @user ||= User.find_by(id: session[:user_id])
    end
  end
  helper_method :find_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def find_searches_by_session
    @session_searches = Search.all.where(user_id: session.id)
  end
  helper_method :find_searches_by_session
end

class ApplicationController < ActionController::Base
  helper_method :current_user
  skip_before_action :verify_authenticity_token

  def current_user
    if session[:user_id]
      @current_user  = User.find(session[:user_id])
    end

    @current_user
  end

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
    redirect_to root_path
  end

  # def logged_in?
  #   !current_user.nil?
  # end
  #
  # def log_out
  #   session.delete(:user_id)
  #   @current_user = nil
  # end

  def index
    if session[:user_id].nil?
      user = User.create(username: "user-#{ SecureRandom.hex(10) }")
      log_in(user)
    end

    @current_user = current_user
    @message = Message.new
    @messages = Message.all
  end
end

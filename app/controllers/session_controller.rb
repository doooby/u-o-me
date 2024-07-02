class SessionController < ApplicationController

  def show
  end

  def create
    @session_email = params[:session_email].presence.strip
    user = User.find_by email: @session_email

    unless user
      @session_fail = :unknown_email
      render turbo_stream: turbo_stream.replace('session_login', partial: 'login')
      return
    end

    unless user.authenticate params[:session_password]
      @session_fail = :bad_password
      render turbo_stream: turbo_stream.replace('session_login', partial: 'login')
      return
    end

    session[:user_id] = user.id
    render turbo_stream: turbo_stream.replace('session_login', partial: 'actions/redirect', locals: { url: session_path })
  end

  def destroy
    reset_session
    redirect_to root_path, alert: 'Proběhlo odhlášení.'
  end

end

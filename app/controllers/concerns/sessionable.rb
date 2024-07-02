module Sessionable
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    @current_user ||= begin
      user_id = session[:user_id]
      User.find_by id: user_id if user_id
    end
  end

  def require_user_session
    unless current_user
      redirect_to session_path, alert: 'Vyžadováno přihlášení'
    end
  end

  def require_admin
    unless current_user&.is_admin?
      redirect_to session_path, alert: 'Neoprávněný vstup'
    end
  end

  def require_super_user
    unless current_user&.is_root?
      redirect_to session_path, alert: 'Neoprávněný vstup'
    end
  end

end

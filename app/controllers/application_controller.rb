class ApplicationController < ActionController::Base
  # Expose these methods to the views
  helper_method :current_user, :signed_in?

  before_filter :require_signed_in!
  around_filter :process_request

  private
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_token!
  end

  def sign_out
    current_user.try(:reset_token!)
    session[:session_token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def process_request
    rescue_exception do
      yield
    end
  end

  def rescue_exception
    yield
  rescue ActiveRecord::RecordNotFound => e
    redirect_to '/404'
  rescue StandardError => e
    render file: 'public/500.html', status: :internal_server_error, layout: false
  end
end

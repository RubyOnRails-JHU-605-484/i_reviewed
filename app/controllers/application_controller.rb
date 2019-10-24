class ApplicationController < ActionController::Base
  before_action :ensure_login
  before_action :set_cache_buster

  private
    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end

  protected
    def ensure_login
      redirect_to login_path unless session[:reviewer_id]
    end

    def logged_in?
      session[:reviewer_id]
    end

    def current_user
      @current_user ||= Reviewer.find(session[:reviewer_id])
    end

    helper_method :logged_in?, :current_user
end




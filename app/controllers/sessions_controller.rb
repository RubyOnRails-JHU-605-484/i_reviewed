class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create, :destroy]

  def new
    # Nothing to do here - go on to new.html.erb
    # (Login page)
  end

  def create
    name = params[:reviewer][:name]
    password = params[:reviewer][:password]
    reviewer = Reviewer.find_by name: name
    if(reviewer && reviewer.authenticate(password))
      session[:reviewer_id] = reviewer.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      redirect_to login_path, alert: "Invalid username/password combination" 
    end
  end

  def destroy
    reset_session    
    redirect_to login_path, notice: "You have been logged out"
  end
end




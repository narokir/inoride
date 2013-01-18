class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  def store_location
    session[:return_to] =
    if request.get?
      request.url
    else
      request.referer
    end
  end
  
  
  def signed_in_user
    unless signed_in?
      store_location
      #session[:params] = params
      #render_to_body(options = {:js => "$('#signinModal').modal('show')"})
      redirect_to signin_url, notice: "Please sign in"
      #render '/shared/_signin'
      #render '/layouts/_signin_modal'
      #format.js { render :js => "$('#signinModal').modal('show')" } # JavaScript to do the redirect
      #format.js { render :js => "$('#signinModal').modal(hide);" }
      #render :js => "$('#signinModal').modal('show')"
      #@js = "$('#signinModal').modal('show');"
      #render :inline => "<%= javascript_tag(@js) %>"
    end
  end
end

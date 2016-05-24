class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_admin!
   redirect_to({controller: "index", :action => "display"}) unless current_admin
   #redirects to previous page
  end

 #  def after_sign_in_path_for(resource)
	# stored_location_for(resource) ||
 #    if resource.is_a?(Admin)
 #      # admin_path
 #      user_path(resource)
 #    else
 #      user_path(resource)
 #    end
 #  end
  def not_found
  	render file: "#{Rails.root}/public/404.html", layout: true, status: 404
  end
end



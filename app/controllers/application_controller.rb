class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_admin!
  	if current_user
  		print "user logged in"
  	else
  		print "no user logged in"
  	end
   redirect_to :back, :status => 401 unless current_admin
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
end



class DashboardController < ApplicationController
  before_filter :authorize_admin!

  def display
  	@users = User.where(approved: false)
  end

  def authorize_user
  	user_id = params[:id]
  	u = User.find_by_id(user_id)
  	if (u == nil)
  		not_found
  		return
  	end
  	u.approved = true
  	u.save()
  	redirect_to({controller: "dashboard", :action => "display"})
  end
end

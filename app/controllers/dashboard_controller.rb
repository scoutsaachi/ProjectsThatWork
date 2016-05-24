class DashboardController < ApplicationController
  before_filter :authorize_admin!

  	#TODO: need to move to admin
	def projectApproval
		@requests = Request.pending
	end

	#TODO: need to move to admin
	def post_approverequest
		requests = Request.pending
		requests.each do |r|
			checkLabel = "check#{r.id}"
			revLabel = "rev#{r.id}"
			if params[checkLabel] == "2"
				r.approve_request
			elsif params[checkLabel] == "3"
				r.deny_request(params[revLabel])
			else
				next
			end
		end
		redirect_to({controller: "dashboard", :action => "projectApproval"})
	end

end

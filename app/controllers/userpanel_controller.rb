class UserpanelController < ApplicationController

	def index
		user = current_user
		if user == nil
			not_found
			return
		end
		@requests = user.requests
	end

end

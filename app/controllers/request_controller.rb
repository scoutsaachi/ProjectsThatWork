class RequestController < ApplicationController
	def approve_requests
		@requests = Request.pending
	end
end

class ReviewsController < ApplicationController
	def newteacher
	end

	def newstudent
	end

	def neworg
	end

	def post_newteacher
		puts params[:id]
		redirect_to({controller: "reviews", :action => "newteacher"})
	end
	def post_newstudent
		puts params
		redirect_to({controller: "reviews", :action => "newstudent"})
	end

	def post_neworg
		puts params
		redirect_to({controller: "reviews", :action => "newstudent"})
	end
end

class ReviewsController < ApplicationController

	def display_teacher_review
		@review = Review.find(params[:id]).specific
		@project = @review.project
		@project_instance = @review.project_instance
	end

	def post_newteacher
		project_instance = ProjectInstance.find(params[:id])
		project_id = project_instance.project.id
		rating = params[:rating] == nil ? nil : params[:rating].to_i
		feasibility = params[:feasibility] == nil ? nil : params[:feasibility].to_i
		le = params[:learning_effectiveness] == nil ? nil : params[:learning_effectiveness].to_i

		TeacherReview.create(review_text: params[:review_text], rating: rating, feasibility: feasibility,
		learning_effectiveness: le, project_id: project_id, project_instance_id: params[:id])
		redirect_to({controller: "projects", :action => "display_instance", :id => params[:id]})	
	end

	def post_newstudent
		project_instance = ProjectInstance.find(params[:id])
		project_id = project_instance.project.id
		participant_field = params[:participants] == nil ? "" : params[:participants].join(", ")
		rating = params[:rating] == nil ? nil : params[:rating].to_i
		feasibility = params[:feasibility] == nil ? nil : params[:feasibility].to_i
		ls = params[:learning_score] == nil ? nil : params[:learning_score].to_i
		pfp = params[:participate_in_future_projects] == nil ? nil : params[:participate_in_future_projects].to_i
		ps = params[:planning_score] == nil ? nil : params[:planning_score].to_i

		StudentReview.create(review_text: params[:review_text], rating: rating, feasibility: feasibility,
		learning_score: ls, participate_in_future_projects: pfp, participants: participant_field, 
		planning_score: ps, project_id: project_id, project_instance_id: params[:id])
		redirect_to({controller: "projects", :action => "display_instance", :id => params[:id]})	
	end

	def post_neworg
		project_instance = ProjectInstance.find(params[:id])
		project_id = project_instance.project.id
		rating = params[:rating] == nil ? nil : params[:rating].to_i
		feasibility = params[:feasibility] == nil ? nil : params[:feasibility].to_i
		impact = params[:impact] == nil ? nil : params[:impact].to_i
		pfp = params[:participate_in_future_projects] == nil ? nil : params[:participate_in_future_projects].to_i

		OrganizationReview.create(review_text: params[:review_text], rating: rating, feasibility: feasibility,
		impact: impact, participate_in_future_projects: pfp, project_id: project_id, project_instance_id: params[:id])
		redirect_to({controller: "projects", :action => "display_instance", :id => params[:id]})	
	end
end

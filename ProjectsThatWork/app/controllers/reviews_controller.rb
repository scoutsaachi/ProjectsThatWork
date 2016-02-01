class ReviewsController < ApplicationController
	def newteacher
	end

	def newstudent
	end

	def neworg
	end

	def post_newteacher
		project_instance = ProjectInstance.find(params[:id])
		project_id = project_instance.project.id
		TeacherReview.create(review_text: params[:review_text], rating: params[:rating].to_i, feasibility: params[:feasibility].to_i,
		learning_effectiveness: params[:learning_effectiveness].to_i, project_id: project_id, project_instance_id: params[:id])
		redirect_to({controller: "projects", :action => "display", :id => project_id})	
	end

	def post_newstudent
		project_instance = ProjectInstance.find(params[:id])
		project_id = project_instance.project.id
		participant_field = params[:participants] == nil ? "" : params[:participants].join(", ")
		StudentReview.create(review_text: params[:review_text], rating: params[:rating].to_i, feasibility: params[:feasibility].to_i,
		learning_effectiveness: params[:learning_effectiveness].to_i, participate_in_future_projects: params[:participate_in_future_projects].to_i,
		participants: participant_field, planning_score: params[:planning_score].to_i, project_id: project_id, project_instance_id: params[:id])
		redirect_to({controller: "projects", :action => "display", :id => project_id})	
	end

	def post_neworg
		project_instance = ProjectInstance.find(params[:id])
		project_id = project_instance.project.id
		OrganizationReview.create(review_text: params[:review_text], rating: params[:rating].to_i, feasibility: params[:feasibility].to_i,
		impact: params[:impact].to_i, participate_in_future_projects: params[:participate_in_future_projects].to_i, project_id: project_id, project_instance_id: params[:id])
		redirect_to({controller: "projects", :action => "display", :id => project_id})	
	end
end

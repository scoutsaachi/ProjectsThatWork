class RequestController < ApplicationController

	#form for creating a project & project instance
	def requestProject
	end

	def requestInstance
		@project = Project.find(params[:id])
	end

	#create a project instance
	def post_newinstance
		if params[:community_partners]
	      params[:community_partners] = (params[:community_partners] == "Yes")
	    end

	   	ProjectInstance.create(project_id: params[:id], school: params[:school], town: params[:town], course: params[:course],
	     grade_level: params[:grade_level], number_of_students: params[:number_of_students], start_date: params[:start_date],end_date: params[:end_date],
	     materials_and_costs: params[:materials_and_costs], learning_goals: params[:learning_goals], community_participation: params[:community_participation],
	     community_partners: params[:community_partners], steps: params[:steps], preparation: params[:preparation],reflection_activities: params[:reflection_activities])
	   	flash[:notice] = "Your request is pending admin approval! We'll let you know by email when it's approved"
    	redirect_to({controller: "projects", :action => "display", :id => params[:id]})
	end

	#create both a project and a project instance
	def post_newproject
		# Create a new project
		p = Project.create(project_name: params[:project_name], course_subject: params[:course_subject], description: params[:description],
        expected_difficulty: params[:expected_difficulty], duration: params[:duration])
	    if params[:id] == nil
	      params[:id] = 1
	    end
	    if params[:categories]
	      for categoryID in params[:categories]
	        c = Category.find(categoryID)
	        p.categories << c
	      end
	    end
	    c = Category.find(params[:id])
	    p.categories << c

		# Create a new project instance
		if params[:community_partners]
	      params[:community_partners] = (params[:community_partners] == "Yes")
		end

	    pi = ProjectInstance.create(project_id: p.id, school: params[:school], town: params[:town], course: params[:course],
	     grade_level: params[:grade_level], number_of_students: params[:number_of_students], start_date: params[:start_date],end_date: params[:end_date],
	     materials_and_costs: params[:materials_and_costs], learning_goals: params[:learning_goals], community_participation: params[:community_participation],
	     community_partners: params[:community_partners], steps: params[:steps], preparation: params[:preparation],reflection_activities: params[:reflection_activities])

	    # Create a request
	    Request.new_request(current_user, p.id, pi.id)

	    #redirect to categories page
	    flash[:notice] = "Your request is pending admin approval! We'll let you know by email when it's approved"
	    redirect_to({controller: "projects", :action => "display_categories", :id => params[:id]})
	end

end

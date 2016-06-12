class RequestController < ApplicationController

	#form for creating a project & project instance
	def requestProject
		@project = Project.new
		@project.project_instances.build
	end

	def requestInstance
		@project = Project.find(params[:id])
		@project_instance = ProjectInstance.new
	end

	def createProject
		# Create a new project
		if admin_signed_in? || user_signed_in?
			project_attr = project_params(params)
			p = Project.create(project_attr)
			# add in the categories
			categories = params[:project][:category_ids]
			for c_id in categories
				if c_id != ""
					category = Category.find(c_id)
					p.categories << category
				end
			end
			p.save

			# create a new project instance
			pi_attr = Hash.new
			pi_attr = params[:project][:project_instances_attributes]["0"]
			pi_attr[:preparation].shift
			pi_attr[:preparation] = pi_attr[:preparation].join (".\n")
			pi_attr[:reflection_activities].shift
			pi_attr[:reflection_activities] = pi_attr[:reflection_activities].join (".\n") 
			pi = ProjectInstance.create(project_instance_params(pi_attr))
			pi.project_id = p.id
			tags = pi_attr[:tag_ids]
			# add in pre-existing tags
		    for tagId in tags
		    	if tagId != ""
		    		t = Tag.find(tagId)
		    		pi.tags << t
		    	end
		    end
		    # add in the new tags
		    newtags = pi_attr[:newTags]
		    if newtags
		    	newtags = newtags.split(",")
		    	for name in newtags
		    		name = name.strip.titlecase
		    		t = Tag.where(approved: true, tag_name: name).first
		    		if t == nil
		    			t = Tag.create(tag_name: name, approved: false)
		    		end
		    		pi.tags << t
		    	end
		    end
		    pi.save

		    cid = current_user ? current_user.id : nil


		    Request.new_request(cid, p.id, pi.id)

		    #redirect to categories page
		    flash[:notice] = "Your request is pending admin approval! We'll let you know by email when it's approved"
		    redirect_to({controller: "projects", :action => "display_categories"})
		else
			redirect_to({controller: "request", :action => "requestProject"})
		end
	end

	def createProjectInstance
		# Create a new project
		if params[:id] && Project.find_by_id(params[:id]) && (admin_signed_in? || user_signed_in?)
			p = Project.find_by_id(params[:id])
			pi_attr = params[:project_instance]
			pi_attr[:preparation].shift
			pi_attr[:preparation] = pi_attr[:preparation].join (".\n")
			pi_attr[:reflection_activities].shift
			pi_attr[:reflection_activities] = pi_attr[:reflection_activities].join (".\n") 
			pi = ProjectInstance.create(project_instance_params(pi_attr))
			pi.project_id = p.id
			tags = pi_attr[:tag_ids]
			# add in pre-existing tags
		    for tagId in tags
		    	if tagId != ""
		    		t = Tag.find(tagId)
		    		pi.tags << t
		    	end
		    end
		    # add in the new tags
		    newtags = pi_attr[:newTags]
		    if newtags
		    	newtags = newtags.split(",")
		    	for name in newtags
		    		name = name.strip.titlecase
		    		t = Tag.where(approved: true, tag_name: name).first
		    		if t == nil
		    			t = Tag.create(tag_name: name, approved: false)
		    		end
		    		pi.tags << t
		    	end
		    end
		    pi.save

		    cid = current_user ? current_user.id : nil

		    Request.new_request(cid, p.id, pi.id)

		    #redirect to categories page
		    flash[:notice] = "Your request is pending admin approval! We'll let you know by email when it's approved"
		    redirect_to({controller: "projects", :action => "display_categories"})
		else
			redirect_to({controller: "request", :action => "requestProject"})
		end
	end

	private
	  def project_instance_params(params)
	    params.permit(:school, :town, :course, :grade_level, :number_of_students, :duration, :duration_notes, :project_notes, :materials_and_costs, :learning_goals, :community_participation, :community_partners, :steps, :preparation, :other_preparation, :reflection_activities, :other_reflection_activities)	  
	  end

	  def project_params(params)
	  	params.require(:project).permit(:project_name, :course_subject, :description, :expected_difficulty, :expected_duration)
	  end
end

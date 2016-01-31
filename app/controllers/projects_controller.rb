class ProjectsController < ApplicationController
  def index

  end

  def post_new
    p "Tried to post the form"

    Project.create(school: params[:school_name], town: params[:town_name], course: params[:course_name],
        grade_level: params[:grade_level], project_goal: params[:project_goal], project_activity: params[:project_activity],
        project_recipient: params[:project_recipient], num_students: params[:num_students], start_date: params[:start_date],
        end_date: params[:end_date], num_days: params[:num_days])
    redirect_to({controller: "projects", :action => "index"})
  end

end

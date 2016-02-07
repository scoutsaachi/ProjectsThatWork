class ProjectsController < ApplicationController
  #display all categories
  def display_categories
    @categories = Category.all
  end

  #post method for creating new category
  def post_newcategory
    Category.create(category_name: params[:category_name])
    redirect_to({controller: "projects", :action => "display_categories"})
  end

  def display_category
    @category = Category.find(params[:id])
  end

  #post method for creating new project
  def post_new
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
    redirect_to({controller: "projects", :action => "display_category", :id => c.id})
  end

  #id must be project id
  def display
    @project = Project.find(params[:id])
  end

  #id must be project instance id
  def display_instance
    @project_instance = ProjectInstance.find(params[:id])
  end

  def post_newinstance
    ProjectInstance.create(project_id: params[:id], school: params[:school], town: params[:town], course: params[:course],
     grade_level: params[:grade_level], number_of_students: params[:number_of_students], start_date: params[:start_date],end_date: params[:end_date],
     materials_and_costs: params[:materials_and_costs], learning_goals: params[:learning_goals], community_participation: params[:community_participation],
     community_partners: params[:community_partners], steps: params[:steps], preparation: params[:preparation],reflection_activities: params[:reflection_activities])
    redirect_to({controller: "projects", :action => "display", :id => params[:id]})
  end


end
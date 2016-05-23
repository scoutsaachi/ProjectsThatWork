class ProjectsController < ApplicationController
  #display all categories
  def display_categories
    @categories = Category.all.sort_by{|c| -1*c.projects.size}
  end

  #post method for creating new category
  def post_newcategory
    Category.create(category_name: params[:category_name])
    redirect_to({controller: "projects", :action => "display_categories"})
  end

  def display_category
    @category = Category.find_by_id(params[:id])
    if @category == nil
      not_found
      return
    end
      @projects = @category.approvedProjects.sort_by {|p| -1*p.project_instances.size}
  end


  #id must be project id
  def display
    @project = Project.find_by_id(params[:id])
    if @project == nil
      not_found
      return
    end
    @reviews = @project.reviews.order(updated_at: :desc).limit(5)
  end

  #id must be project instance id
  def display_instance
    @project_instance = ProjectInstance.find_by_id(params[:id])
    if @project_instance == nil
      not_found
      return
    end
    @teacher_reviews = @project_instance.reviews.where(actable_type: "TeacherReview")
    @student_reviews = @project_instance.reviews.where(actable_type: "StudentReview")
    @organization_reviews = @project_instance.reviews.where(actable_type: "OrganizationReview")
  end

  def browse
    @projects = Project.where(approved: true)
    if params[:expected_difficulty]
      @projects = @projects.where(expected_difficulty: params[:expected_difficulty])
    end
    if params[:category]
      cat_id = params[:category].to_i
      @projects = @projects.includes(:categories).where(categories: {id: cat_id})
    end
    if params[:sort_by] == nil
      params[:sort_by] = 1
    end
    case params[:sort_by].to_i
    when 1
      @projects = @projects.includes(:rating_aggregate).order("rating_aggregates.rating DESC").references(:rating_aggregates)
    when 2
      @projects = @projects.order(created_at: :desc)
    when 3
      @projects = @projects.order(created_at: :asc)
    when 4
      @projects = @projects.sort_by {|p| p.project_instances.count}
    when 5
      @projects = @projects.includes(:rating_aggregate).order("rating_aggregates.feasibility DESC").references(:rating_aggregates)
    end
  end

  def post_filter_projects
    options = {controller: "projects", :action => "browse"}
    if params[:expected_difficulty] != "Any"
      options[:expected_difficulty] = params[:expected_difficulty]
    end
    if params[:category] != "-1"
      options[:category] = params[:category]
    end
    options[:sort_by] = params[:sort_by]
    redirect_to(options)
  end
end
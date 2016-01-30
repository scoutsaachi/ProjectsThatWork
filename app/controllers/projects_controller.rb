class ProjectsController < ApplicationController
  def index

  end

  def post_new
    p "Tried to post the form"
    redirect_to({controller: "projects", :action => "index"})
  end

end

class Category < ActiveRecord::Base
  has_and_belongs_to_many :projects

  def approvedProjects
  	return self.projects.where(approved: true)
  end

  def numApprovedProjects
  	return approvedProjects.size
  end
end

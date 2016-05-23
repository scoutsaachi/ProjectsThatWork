class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :project_instances
    has_many :requests

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message
  	:not_approved
    # if !approved? 
    #   :not_approved 
    # else 
    #   super # Use whatever other message 
    # end 
  end
end

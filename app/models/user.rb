class User < ActiveRecord::Base
    has_many :project_instances
end

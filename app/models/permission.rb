class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :convoy_plan
end

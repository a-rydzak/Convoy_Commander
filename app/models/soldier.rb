class Soldier < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :convoy_plan
end

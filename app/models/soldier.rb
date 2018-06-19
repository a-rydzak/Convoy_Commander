class Soldier < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :convoy_plan
  # columns include: soldier_name (string), rank (string), position(string), vehicle_id (int)
  # 				 created_at (date), updated_at (date), convoy_plan_id(int)

  validates :convoy_plan_id, :vehicle_id, presence: true, numericality: { only_integer: true }
  validates :soldier_name, presence: true, length: { in: 2..20 } 
  validates :rank, :position, presence: true, length: { in: 2..20 } 



end

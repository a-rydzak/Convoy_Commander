class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :convoy_plan
  # Columns include user_id (int), invited_user (int), permission_plan (string), 
  #			permission_vehicle (string), created_at (date), updated_at (date)
  validates :user_id, presence: true 
  validates :user_id, presence: true 

  # validate :plan_permission

  private

  # def plan_permission  -------------------------Come back to this to validate permissions

  # end

end

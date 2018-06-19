class Vehicle < ActiveRecord::Base
  belongs_to :convoy_plan
  has_many :soldiers, dependent: :destroy
  #columns include: vehicle_type (string), call_sign (string), serial_number (int), order_of_movement (int)
  # 				bumper_number (string), convoy_plan_id (int), created_at(date), updated_at(date)

  validates :vehicle_type,:call_sign, :bumper_number, presence: true, length: {in: 2..20}
  validates :serial_number, :order_of_movement, :convoy_plan_id, presence: true, numericality: { only_integer: true }

end

class ConvoyPlan < ActiveRecord::Base
  belongs_to :user
  has_one :plan, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :soldiers, dependent: :destroy
  # Columns include title, user_id, created_at, updated_at

  validates :title, presence: true, length: { in: 2..30} 
 



end

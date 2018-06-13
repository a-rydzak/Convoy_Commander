class ConvoyPlan < ActiveRecord::Base
  belongs_to :user
  has_one :plan, dependent: :destroy
  has_many :vehicles, dependent: :destroy
end

class Vehicle < ActiveRecord::Base
  belongs_to :convoy_plan
  has_many :soldiers, dependent: :destroy
end

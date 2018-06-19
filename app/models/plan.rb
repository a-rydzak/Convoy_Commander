class Plan < ActiveRecord::Base
  belongs_to :convoy_plan
  #columns include situation (text), mission (text), execution (text), sevice_support (text)
  #                command_signal (text), service_support (text), convoy_plan_id (int)

  validates :convoy_plan_id, presence: true, numericality: { only_integer: true }
end

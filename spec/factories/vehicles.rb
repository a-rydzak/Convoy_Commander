FactoryBot.define do
  factory :vehicle do
    type ""
    call_sign "MyString"
    serial_number 1
    order_of_movement 1
    bumper_number "MyString"
    convoy_plan nil
  end
end

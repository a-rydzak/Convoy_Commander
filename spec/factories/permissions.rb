FactoryBot.define do
  factory :permission do
    user nil
    invited_user 1
    permission_plan "MyString"
    permission_vehicle "MyString"
  end
end

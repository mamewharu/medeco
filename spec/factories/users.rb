FactoryBot.define do
  factory :user do
    name                  {"ああい"}
    email                 {'test@example'}
    password              {'000000a'}
    password_confirmation {password}
    staff_num             {'11111'}
    occupation            {'あああ'}
  end
end

FactoryGirl.define do
  
  factory :user do
    first_name "Capital"
    last_name "One"
    email "cap1@example.com"
    nickname "Cap1"
    funds 100
    password "secret"
    password_confirmation "secret"
  end

end
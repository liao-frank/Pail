FactoryGirl.define do
  
  factory :user do
    first_name "Capital"
    last_name "One"
    email { |u| "#{u.first_name[0]}#{u.last_name}#{(1..99).to_a.sample}@example.com".downcase }
    nickname { |u| "#{u.first_name[0]}#{u.last_name}".downcase }
    funds 100
    password "secret"
    password_confirmation "secret"
  end

end
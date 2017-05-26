FactoryGirl.define do
  
  factory :user do
    first_name "Capital"
    last_name "One"
    email { |u| "#{u.first_name[0]}#{u.last_name.gsub(/\s+/,"")}#{(1..99).to_a.sample}@example.com".downcase }
    nickname { |u| "#{u.first_name[0]}#{u.last_name.gsub(/\s+/,"")}".downcase }
    funds 5000
    password "secret"
    password_confirmation "secret"
  end

  factory :fundraiser do
    name "Fundraiser 1"
    category "flex"
    goal 10000
    raised 0
    start_date Date.current
    end_date nil
    description "A nice test fundraiser for us all :)"
  end

  factory :payment do
    amount 10.00
    message 'Here you go!'
    payment_receipt nil
    date Date.current
  end

  factory :organization do
    name "Capital One Summiteers"
    description "The nerdiest group of software engineers you'll ever meet!"
  end

  factory :organization_user do
    role "member"
    title nil
  end

  factory :message do
    message_text "Hey guys! I really like our organization!"
    likes 0
    date_time Time.now
  end

end
namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    require 'factory_girl_rails'
    require 'populator'
    include Populator
    
    # Step 0: drop old databases and rebuild
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke

    # Step 1: Create Users
    @frank = FactoryGirl.create(:user, first_name: "Frank", last_name: "Liao")
    @winston = FactoryGirl.create(:user, first_name: "Winston", last_name: "Chu")
    @ben = FactoryGirl.create(:user, first_name: "Ben", last_name: "Catarevas")
    @jason  = FactoryGirl.create(:user, first_name: "Jason", last_name: "Valentino")
    @sarah = FactoryGirl.create(:user, first_name: "Sarah", last_name: "Ziegenfuss")
    @firoze = FactoryGirl.create(:user, first_name: "Firoze", last_name: "Lafeer")
    @louie = FactoryGirl.create(:user, first_name: "Louie", last_name: "De La Rosa")

    40.times do |i|
      fn = Faker::Name.first_name
      ln = Faker::Name.last_name
      FactoryGirl.create(:user, first_name: "#{fn}", last_name: "#{ln}")
    end

    # Step 2: Create fundraisers
    users = [1,5,10,15,20,25,30,35,40,45]
    count = 2
    @jasons_fund = FactoryGirl.create(:fundraiser, owner_id: @jason, name: "Capital One Software Engineering Summit", category: "flex", goal: 10000, raised: 50)
    for u in users
      cat = %w[threshold flex].sample
      goal = Faker::Number.number(5)
      raised = Faker::Number.between(0,100)
      owner = Faker::Number.between(2,4)
      FactoryGirl.create(:fundraiser, owner_id: owner, name: "Fundraiser #{count}", category: cat, goal: goal, raised: raised)
    end

    # Step 2: Create Payments
    for u in User.all 
      payee = (1..47).to_a.sample
      f_id = Faker::Number.between(1,10)
      amount = Faker::Number.decimal(2)
      FactoryGirl.create(:payment, payer_id: u.id, payee_id: payee, fundraiser_id: f_id, amount: amount)
    end

  end
end
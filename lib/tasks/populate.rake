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
    @frank   = FactoryGirl.create(:user, first_name: "Frank", last_name: "Liao")
    @winston   = FactoryGirl.create(:user, first_name: "Winston", last_name: "Chu")
    @ben  = FactoryGirl.create(:user, first_name: "Ben", last_name: "Catarevas")
    @jason     = FactoryGirl.create(:user, first_name: "Jason", last_name: "Valentino")
    @sarah = FactoryGirl.create(:user, first_name: "Sarah", last_name: "Ziegenfuss")
    @firoze = FactoryGirl.create(:user, first_name: "Firoze", last_name: "Lafeer")
    @louie = FactoryGirl.create(:user, first_name: "Louie", last_name: "De La Rosa")

    40.times do |i|
      fn = Faker::Name.first_name
      ln = Faker::Name.last_name
      FactoryGirl.create(:user, first_name: "#{fn}", last_name: "#{ln}")
    end

  end
end
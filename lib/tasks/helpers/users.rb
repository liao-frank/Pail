module Populator
  module Users
    
    require 'faker'
    
    def create_users
      @frank   = FactoryGirl.create(:user, first_name: "Frank", last_name: "Liao")
      @winston   = FactoryGirl.create(:user, first_name: "Mark", last_name: "Vella")
      @ben  = FactoryGirl.create(:user, first_name: "Israel", last_name: "Madueme")
      @jason     = FactoryGirl.create(:user, first_name: "Ben", last_name: "Junker")
      @sarah = FactoryGirl.create(:user, first_name: "Melanie", last_name: "Freeman")

      40.times do |i|
        fn = Faker::Name.first_name
        ln = Faker::Name.last_name
        FactoryGirl.create(:user, first_name: "#{fn}", last_name: "#{ln}")
      end
    end
  end
end
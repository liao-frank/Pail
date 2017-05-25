module Populator
  
  module Users
        
    def create_users
      @frank   = FactoryGirl.create(:user, first_name: "Frank", last_name: "Liao")
      @winston   = FactoryGirl.create(:user, first_name: "Winston", last_name: "Chu")
      @ben  = FactoryGirl.create(:user, first_name: "Ben", last_name: "Catarevas")
      @jason     = FactoryGirl.create(:user, first_name: "Jason", last_name: "Valentino")
      @sarah = FactoryGirl.create(:user, first_name: "Sarah", last_name: "Ziegenfuss")

      40.times do |i|
        fn = Faker::Name.first_name
        ln = Faker::Name.last_name
        FactoryGirl.create(:user, first_name: "#{fn}", last_name: "#{ln}")
      end
    end
  end

end

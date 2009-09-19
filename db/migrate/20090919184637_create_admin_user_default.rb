class CreateAdminUserDefault < ActiveRecord::Migration
  def self.up
    User.create({:login=>"admin", :email=>"admin@test.com", :password => "admin", :password_confirmation => "admin", :status => true})
  end

  def self.down
    User.find_by_login("admin").destroy
  end
end


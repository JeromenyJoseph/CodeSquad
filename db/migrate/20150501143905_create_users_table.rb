class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :fname
  		t.string :lname
  		t.integer :age
  		t.string :email
  		t.string :password
  		t.string :gender
  		t.string :location
  		t.string :linkedin
  		t.string :github
  	end
  end
end

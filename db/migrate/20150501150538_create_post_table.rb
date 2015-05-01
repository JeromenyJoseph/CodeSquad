class CreatePostTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :post
   end
 end
end
class User < ActiveRecord::Base
	has_many :posts
	# has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
	# has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
end

class Post < ActiveRecord::Base
	belongs_to :user
end

class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"
	# validate_uniqueness_of :follower_id, scope: :followed_id
end

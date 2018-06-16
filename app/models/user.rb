class User < ActiveRecord::Base
	has_many :bookmarks
	has_many :feeds
	has_many :friendships
	has_many :friends, through: :friendships
	has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
	has_many :inverse_friends, through: :inverse_friendships, source: :user

	has_many :bookmark_feeds, through: :bookmarks, source: :feed
	
	mount_uploader :image, ImageUploader
	
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  # default_scope { where(first_name: 'guddu') }
  scope :search, -> (keyword){ where("first_name like ? or last_name like ? or email like ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%") }

  scope :ab, -> { User.all } 
  scope :bc, -> (name) { User.where(first_name: name) }
  
  def all_my_friends
  	(friends + inverse_friends)	
  end 

  def full_name
    binding.pry
    first_name + email
  end

  def all_first_name
    User.first
  end
 
end

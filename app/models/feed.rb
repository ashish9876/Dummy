class Feed < ApplicationRecord
 	belongs_to :user 
 	has_many :bookmarks
 	
 	
  enum permission: [ :universal, :friends ,:only_me]
  mount_uploader :image, ImageUploader
    
  scope :published, ->  { where("created_at < ?", Time.now) }

  scope :search , -> (search){ search.present? ? where('text LIKE ?', "%#{search}%") : all}

  def mmm
    user= User.all 
  end

  def feed
    puts "feed"
   end
   
   def Feed.abc
    puts "abc"
   end

   def self.abcd
      puts "abcd"
   end 
end

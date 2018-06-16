class Friendship < ApplicationRecord
 belongs_to :user
 belongs_to :friend, class_name: 'User'




  # scope :search, -> (search){search.present? ? where(@user.first_name LIKE ? or last_name like ? or email like ?", "%#{search}%", "%#{search}%", "%#{search}%") }
  

 end


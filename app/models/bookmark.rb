class Bookmark < ApplicationRecord
 belongs_to :user
 belongs_to :feed, counter_cache: true

end

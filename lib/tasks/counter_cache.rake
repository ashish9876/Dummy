desc 'Counter cache for feed has many bookmarks'

task bookmark_counter: :environment do
  Feed.reset_column_information
  Feed.pluck(:id).each do |p|
    Feed.reset_counters p.id, :bookmarks
  end
end

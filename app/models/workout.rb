class Workout < ActiveRecord::Base
  validates :title, :youtube_url, presence: true

  def self.search term
    where('title LIKE ?', "%#{term}%")
  end
end

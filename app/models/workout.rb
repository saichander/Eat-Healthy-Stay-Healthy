class Workout < ActiveRecord::Base
  validates :title, :youtube_url, presence: true
end

class FoodItem < ActiveRecord::Base
  validates :item, :quantity, :metrics, :calories, :preferred_time, presence: true
  validates :item, uniqueness: true
  validates :quantity, :calories, numericality: {only_integer: false, :allow_blank => true}

  def self.get_time_of_the_day
    time = Time.zone.now.hour
    if time >= 5 && time < 12
      "morning"
    elsif time >= 12 && time < 16
      "afternoon"
    elsif time >= 16 &&  time < 21
      "evening"
    else time >=21 && time < 5
      "night"
    end
  end
end

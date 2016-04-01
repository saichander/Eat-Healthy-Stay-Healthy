class BodyMetric < ActiveRecord::Base
  belongs_to :user
  before_save :calc_calories

  validates :height, :weight, presence: true, numericality: {only_integer: true, :allow_blank => true}
  validates :activity_level, inclusion: [1.2,1.375,1.55,1.725,1.9]

  def calc_calories
    self.calculated_calories = calculate_required_calories(self.user_id, self.weight, self.height, self.activity_level)
  end

  def calculate_required_calories user_id, weight, height, activity_level
    user = User.find_by(id: user_id)

    if user.male?
      (66 + (13.7 * weight) + (5 * height) - (6.8 * user.age)) * activity_level
    else
      (655 + (9.6 * weight) + (1.8 * height) - (4.7 * user.age)) * activity_level
    end
  end
end

class BodyMetric < ActiveRecord::Base
  belongs_to :user
  after_create :calc_calories
  after_update :calc_calories_update

  validates :height, :weight, presence: true, numericality: {only_integer: true, :allow_blank => true}
  validates :activity_level, inclusion: [1.2,1.375,1.55,1.725,1.9]

  def calc_calories
    @user = User.find_by(id: user_id)
    @age =  (Date.today-@user.dob).to_i / 365
    if @user.gender = "male"
      @calories = (66+(13.7*self.weight)+(5*self.height)-(6.8*@age))*self.activity_level
    else
      @calories = (655+(9.6*self.weight)+(1.8*self.height)-(4.7*@age))*self.activity_level
    end
    self.update_attributes(calculated_calories: @calories)
  end


  def calc_calories_update
    @user = User.find_by(id: user_id)
    @age =  (Date.today-@user.dob).to_i / 365
    if @user.gender = "male"
      @calories = (66+(13.7*self.weight)+(5*self.height)-(6.8*@age))*self.activity_level
    else
      @calories = (655+(9.6*self.weight)+(1.8*self.height)-(4.7*@age))*self.activity_level
    end
    if self.calculated_calories != @calories.to_i
      self.update_attributes(calculated_calories: @calories)
    end
  end

end

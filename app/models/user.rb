class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :body_metric, dependent: :destroy
  has_many :food_records, dependent: :destroy

  def today_food_records
    FoodRecord.food_records_by_date.where(user_id: self.id)
  end

  def male?
    gender == "male"
  end

  def female?
    gender == "female"
  end

  def age
    (Date.today - self.dob).to_i / 365
  end
end

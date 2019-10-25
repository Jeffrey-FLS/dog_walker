
class DogOwner < ActiveRecord::Base
  has_many :appointments
  has_many :dog_walkers, through: :appointments

  has_many :reviews
  has_many :dog_walkers, through: :reviews

  has_many :available_work_days
  has_many :dog_walkers, through: :available_work_days

  has_one :account

  def self.username_password_auth(username, password)
    find_by(username: username, password: password)
  end
end
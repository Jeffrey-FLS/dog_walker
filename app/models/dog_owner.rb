

class DogOwner < ActiveRecord::Base
  has_many :appointments
  has_many :dog_walkers, through: :appointments

  has_many :reviews
  has_many :dog_walkers, through: :reviews

  def password_authentication(username, password)

  end

end
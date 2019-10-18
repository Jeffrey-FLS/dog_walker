

class DogOwner < ActiveRecord::Base
  has_many :appointments
  has_many :dog_walkers, through: :appointments

  has_many :reviews
  has_many :dog_walkers, through: :reviews

end
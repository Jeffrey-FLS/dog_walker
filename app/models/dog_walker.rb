

class Dog_Walker < ActiveRecord::Base
  has_many :appointments
  has_many :dog_owners, through: :appointments

  has_many :reviews
  has_many :dog_owners, through: :reviews


end
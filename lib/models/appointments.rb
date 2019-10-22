
class Appointment < ActiveRecord::Base
  belongs_to :dog_owner
  belongs_to :dog_walker

end

class AvailableWorkDay < ActiveRecord::Base
  belongs_to :dog_walker
  belongs_to :dog_owner
end
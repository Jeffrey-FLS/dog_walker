
class AvailableWorkDay < ActiveRecord::Base
  belongs_to :dog_walker
  belongs_to :dog_owner

  def self.availability_list
    include TimeCalc
    TimeCalc.schedule_list(all)
  end
end
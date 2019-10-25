
class Account < ActiveRecord::Base
  belongs_to :dog_owner

  attr_accessor :username, :password

  def password_authentication(username, password)
    dog_owner = find_by(username: username, password: password)
    return dog_owner.dog_owner_id
  end
end
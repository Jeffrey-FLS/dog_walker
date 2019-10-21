require_relative 'spec_helper'
require_relative '../app/models/dog_owner'

describe DogOwner do

  before(:each) do
    @dog_owner1 = DogOwner.create(:username => "Jake7", :password => "123456", :name => "Paul", :phone_number => 9789999999, :address => "11 Broadway st")
  end

  describe "attributes" do
    it "has data attributes given to it from a migration file" do
      expect(@dog_owner1.name).to eq("Paul")
    end
  end


end
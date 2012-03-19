require 'spec_helper'

describe Person do
  before(:each) do
    @person = Person.create!(:first_name => 'John', :last_name => 'Doe', :title => 'Mr.', :phone_cell => '1-510-123-4567',
      :email1 => 'abc@berkeley.edu')
  end
  
  describe ".search" do 
    it "searches for people by first name" do
       Person.search({'first_name' => 'John'}).should eq([@person])
    end

    it "searches for people by last name" do
       Person.search({'last_name' => 'Doe'}).should eq([@person])
    end

    it "searches for people by full name" do
       Person.search({'full_name' => 'John Doe'}).should eq([@person])
    end

  end
end

require 'spec_helper'

describe Person do
  before(:each) do
    @person = Person.create!(:first_name => 'John', :last_name => 'Doe', :title => 'Mr.', :phone_cell => '1-510-123-4567',
      :email1 => 'abc@berkeley.edu')
  end
  
  describe ".search" do 
    it "searches for people by first name" do
      Person.search('John').should eq([@person])
    end

    it "searches for people by last name" do
       Person.search('Doe').should eq([@person])
    end

    it "searches for people by full name" do
       Person.search('John Doe').should eq([@person])
    end

    it "searches for people by first name case-insentitively" do
      Person.search('john').should eq([@person])
      Person.search('JOHN').should eq([@person])
    end

    it "searches for people by last name case-insentitively" do
      Person.search('doe').should eq([@person])
      Person.search('DOE').should eq([@person])
    end

    it "searches for people by full name case-insentitively" do
      Person.search('john doe').should eq([@person])
      Person.search('JOHN DoE').should eq([@person])
    end

  end
end

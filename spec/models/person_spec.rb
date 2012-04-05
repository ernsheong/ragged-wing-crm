require 'spec_helper'

describe Person do
  before(:each) do
    @person = Person.create!(:first_name => 'John', :last_name => 'Doe', :title => 'Mr.', :phone_cell => '1-510-123-4567',
      :email1 => 'abc@berkeley.edu')
    ['Donor', 'Volunteer', 'Audience'].each do |rel|
      Relationship.create!(:person_id => @person.id, :name => rel)
    end
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

  describe ".find_all_by_full_name" do 
    it "searches by first and last name by small case" do 
      Person.find_all_by_full_name('john doe').should eq([@person])
    end
  end

  describe "#has_relationship" do 
    it "verifies that the person indeed has those relationships with RWE" do 
      @person.has_relationship?('Donor').should be_true
      @person.has_relationship?('Volunteer').should be_true
      @person.has_relationship?('Audience').should be_true
      @person.has_relationship?('Collaborator').should be_false
      @person.has_relationship?('Contract Worker').should be_false
      @person.has_relationship?('Core Artist').should be_false
    end
  end

  describe "#save_relationships" do 
    it "should delete relationships that are not in update" do 
      @person.save_relationships(['Donor', 'Volunteer'])
      @person.has_relationship?('Audience').should be_false
      @person.has_relationship?('Donor').should be_true
      @person.has_relationship?('Volunteer').should be_true
    end

    it "should add additional relationships that are in update but not in existing relationships" do 
      @person.save_relationships(['Donor', 'Volunteer', 'Audience', 'Contract Worker', 'Consultant'])
      @person.has_relationship?('Audience').should be_true
      @person.has_relationship?('Donor').should be_true
      @person.has_relationship?('Volunteer').should be_true
      @person.has_relationship?('Contract Worker').should be_true
      @person.has_relationship?('Consultant').should be_true
    end

    it "should both add additional relationships in update and delete relationships not in update simultaneously" do
      @person.save_relationships(['Volunteer', 'Audience', 'Contract Worker', 'Consultant'])
      @person.has_relationship?('Audience').should be_true
      @person.has_relationship?('Volunteer').should be_true
      @person.has_relationship?('Contract Worker').should be_true
      @person.has_relationship?('Consultant').should be_true
    end
  end

  describe "#print_relationships" do 
    it "should print out relationships in alphabetical order" do 
      @person.print_relationships.should eq('Audience, Donor, Volunteer')
    end
  end

end

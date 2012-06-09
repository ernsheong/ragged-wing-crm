require 'spec_helper'

describe Donation do
  before(:each) do
    @person1 = FactoryGirl.create(:person)
    @person2 = FactoryGirl.create(:person)
    @person3 = FactoryGirl.create(:person)
    @donation1 = Donation.create!(:amount => 10, :date => '2012-04-15', :person_id => @person1.id)
    @donation2 = Donation.create!(:amount => 50, :date => '2010-10-25', :person_id => @person2.id)
    @donation3 = Donation.create!(:amount => 50, :date => '2008-07-09', :person_id => @person3.id)
    @donation4 = Donation.create!(:amount => 80, :date => '2008-07-09', :person_id => @person3.id)
  end

  describe ".donor_list" do 
    it "returns an array of Person IDs" do 
      Donation.donor_list([ @donation1.id.to_s]).should eq [1]
      Donation.donor_list([ "1", "2" ]).should eq [1,2]
      Donation.donor_list([ @donation1.id.to_s, @donation2.id.to_s, @donation3.id.to_s ]).should eq [1, 2, 3]
    end

    it "does not return duplicate Person IDs" do 
      Donation.donor_list([ "3", "4" ]).should eq [3]
    end

    it "returns nil if there is no donor list" do 
      Donation.donor_list(nil).should eq nil
    end
  end

  describe ".search_by_specific_amount" do
    it "returns donations with a specified amount" do
      Donation.search_by_specific_amount(10).should eq([@donation1])
      Donation.search_by_specific_amount(50).should eq([@donation2, @donation3])
      Donation.search_by_specific_amount(100).should eq([])
    end
  end

  describe ".search_by_range_amount" do
    it "returns donations with amounts in the specified range" do
      Donation.search_by_range_amount(0, 100).should eq([@donation1, @donation2, @donation3, @donation4])
      Donation.search_by_range_amount(10, 40).should eq([@donation1])
      Donation.search_by_range_amount(40, 50).should eq([@donation2, @donation3])
      Donation.search_by_range_amount(20, 40).should eq([])
    end
  end

  describe ".total_amount" do
    it "sums up the amounts of the specified donations" do
      Donation.total_amount(Donation.all).should eq(190)
      Donation.total_amount([]).should eq(0)
      Donation.total_amount([@donation1, @donation2]).should eq(60)
    end
  end

  describe ".get_donations_between_dates" do
    it "returns donations with dates in the specified range" do
      Donation.get_donations_between_dates('2008-01-01', '2013-01-01').should eq([@donation1, @donation2, @donation3, @donation4])
      Donation.get_donations_between_dates('2006-01-01', '2008-01-01').should eq([])
      Donation.get_donations_between_dates('2010-10-25', '2012-04-15').should eq([@donation1, @donation2])
    end
  end

  describe ".search_people_by_range_amount" do
    it "should return a list of people who donated within the range specified" do
      Donation.search_people_by_range_amount(60,100).should eq([@person3.id])
      Donation.search_people_by_range_amount(20,50).should eq([@person2.id, @person3.id])
    end
  end
end

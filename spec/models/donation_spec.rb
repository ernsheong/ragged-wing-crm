require 'spec_helper'

describe Donation do
  before(:each) do
    @donation1 = Donation.create!(:amount => 10)
    @donation2 = Donation.create!(:amount => 50)
    @donation3 = Donation.create!(:amount => 50)
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
      Donation.search_by_range_amount(0, 100).should eq([@donation1, @donation2, @donation3])
      Donation.search_by_range_amount(10, 40).should eq([@donation1])
      Donation.search_by_range_amount(40, 50).should eq([@donation2, @donation3])
      Donation.search_by_range_amount(20, 40).should eq([])
    end
  end

  describe ".total_amount" do
    it "sums up the amounts of the specified donations" do
      Donation.total_amount(Donation.all).should eq(110)
      Donation.total_amount([]).should eq(0)
      Donation.total_amount([@donation1, @donation2]).should eq(60)
    end
  end
end

require "spec_helper"

describe DonationsController do
  describe "routing" do

    it "routes to #index" do
      get("/donations").should route_to("donations#index")
    end

    it "routes to #new" do
      get("/donations/new").should route_to("donations#new")
    end

    it "routes to #show" do
      get("/donations/1").should route_to("donations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/donations/1/edit").should route_to("donations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/donations").should route_to("donations#create")
    end

    it "routes to #update" do
      put("/donations/1").should route_to("donations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/donations/1").should route_to("donations#destroy", :id => "1")
    end

  end
end

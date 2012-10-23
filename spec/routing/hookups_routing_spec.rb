require "spec_helper"

describe HookupsController do
  describe "routing" do

    it "routes to #index" do
      get("/hookups").should route_to("hookups#index")
    end

    it "routes to #new" do
      get("/hookups/new").should route_to("hookups#new")
    end

    it "routes to #show" do
      get("/hookups/1").should route_to("hookups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hookups/1/edit").should route_to("hookups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hookups").should route_to("hookups#create")
    end

    it "routes to #update" do
      put("/hookups/1").should route_to("hookups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hookups/1").should route_to("hookups#destroy", :id => "1")
    end

  end
end

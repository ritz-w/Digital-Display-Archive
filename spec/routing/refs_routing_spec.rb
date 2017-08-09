require "rails_helper"

RSpec.describe RefsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/refs").to route_to("refs#index")
    end

    it "routes to #new" do
      expect(:get => "/refs/new").to route_to("refs#new")
    end

    it "routes to #show" do
      expect(:get => "/refs/1").to route_to("refs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/refs/1/edit").to route_to("refs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/refs").to route_to("refs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/refs/1").to route_to("refs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/refs/1").to route_to("refs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/refs/1").to route_to("refs#destroy", :id => "1")
    end

  end
end

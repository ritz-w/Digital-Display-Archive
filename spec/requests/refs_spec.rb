require 'rails_helper'

RSpec.describe "Refs", type: :request do
  describe "GET /refs" do
    it "works! (now write some real specs)" do
      get refs_path
      expect(response).to have_http_status(200)
    end
  end
end

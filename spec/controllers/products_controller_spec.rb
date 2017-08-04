require 'rails_helper'

describe ProductsController, :type => :controller do

  describe "POST #create" do
    before do
      @product = FactoryGirl.create(:product1)
    end   
    context "product successfully created" do
      it "will save product" do
        expect(@product.save).to eq true
      end
    end
  end

  describe "PATCH #update" do
    before do
      @product = FactoryGirl.create(:product1)
      @product.update(name: "New Product Name")
    end
   
    context "product changes saved" do
      it "will save changes" do
        expect(@product.save).to eq true
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @product = FactoryGirl.create(:product1)
      @product.destroy
    end
   
    context "product deleted" do
      it "will delete product" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end
end
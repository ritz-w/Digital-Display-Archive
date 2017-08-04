require 'rails_helper'

describe Product do
  before do
    @product = FactoryGirl.create(:product1)
    @user = FactoryGirl.create(:user)
  end

  it "returns the average rating of all comments" do
    FactoryGirl.create(:comment, product: @product, user: @user)
    FactoryGirl.create(:comment, rating: 1, product: @product, user: @user)
    FactoryGirl.create(:comment, rating: 5, product: @product, user: @user)
    expect(@product.average_rating).to eq 3
  end

  it "is not valid" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
  end
end
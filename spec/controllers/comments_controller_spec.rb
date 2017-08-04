require 'rails_helper'

describe CommentsController, :type => :controller do

  describe "POST #create" do
    before do
      @product = FactoryGirl.create(:product1)
      @user = FactoryGirl.create(:user)
      @comment = FactoryGirl.create(:comment, product: @product, user: @user)
    end
    context "comment posted" do
      it "will save comment" do
        expect(@comment.save).to eq true
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @product = FactoryGirl.create(:product1)
      @user = FactoryGirl.create(:user)
      @comment = FactoryGirl.create(:comment, product: @product, user: @user)
    end

    context "delete comment" do
      it "will delete comment" do
        controller.params[:id] = @product.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

end
require 'rails_helper'

describe User do
  before do
    @user1 = FactoryGirl.create(:user)
  end

  it "validates user password" do
   expect(FactoryGirl.create(:user)).to be_valid
   expect(FactoryGirl.build(:user3)).not_to be_valid
  end
end
require 'rails_helper'

describe UsersController, :type => :controller do
  let(:user) {FactoryGirl.create(:user)}
  let(:user2) {FactoryGirl.create(:user2)}

  describe 'GET #show' do
    context 'User 1 is logged in' do
      before do
        sign_in user
      end
      
      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq user
      end

      it 'cannot access User 2 details' do
        get :show, params: { id: user2.id }
        expect(response).to redirect_to(root_path)
      end
    end


    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to('/login')
      end
    end
  end

end
require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    let(:new_user_attributes) do
        {
            name: "BlocHead",
            email: "blochead@bloc.io",
            password: "blochead",
            password_confirmation: "blochead"
        }
      end

      describe "GET new" do
        it "returns http success" do
          get :new
          expect(response).to be_successful
        end
    
        it "instantiates a new user" do
          get :new
          expect(assigns(:user)).to_not be_nil
        end
      end

      # #3
   describe "POST create" do
    it "returns an http redirect" do
      post :create, params: { user: new_user_attributes }
      expect(response).to have_http_status(:redirect)
    end

# #4
    it "creates a new user" do   # the 'expect' format is different
      expect{
        post :create, params: { user: new_user_attributes }
      }.to change(User, :count).by(1)   # don't have to get previous count? more ActiveRecord magic?
    end

# #5
    it "sets user name properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).name).to eq new_user_attributes[:name]
    end

# #6
    it "sets user email properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).email).to eq new_user_attributes[:email]
    end

# #7
    it "sets user password properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).password).to eq new_user_attributes[:password]
    end

# #8
    it "sets user password_confirmation properly" do
      post :create, params: { user: new_user_attributes }
      expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
    end

    it "logs the user in after sign up" do
      post :create, params: { user: new_user_attributes }
      expect(session[:user_id]).to eq assigns(:user).id
    end
  end

end

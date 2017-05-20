require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  let(:user_params) { attributes_for(:user_with_phone) }
  let(:user) { create(:user) }
  let(:users) { create_list(:confirmed_user, 3) }
  # Display jsons
  render_views

  # Login to http basic auth
  include AuthHelper
  before(:each) do
    http_login
  end

  describe "GET /api/v1/users" do
    it "should render all users" do
      users
      get :index, params: { format: 'json' }
      expect(response).to render_template(:index)
      json = JSON.parse(response.body)
      expect(json.count).to eq users.count
    end
  end

  describe "GET /api/v1/users/:id" do
    it "should show user data" do
      get :show, params: { id: user.id, format: 'json' }
      expect(response).to render_template(:show)
      json = JSON.parse(response.body)
      expect(json['id']).to eq user.id
      expect(json['email']).to eq user.email
    end
  end

  describe "POST /api/v1/users" do
    it "should create user" do
      post :create, params: {user: user_params, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['email']).to eq user_params[:email]
      user = User.find(json['id'])
      expect(user).not_to be_nil
    end
  end

  describe "PATCH /api/v1/users" do
    it "should edit user" do
      patch :update, params: {id: user.id, user: user_params, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['name']).to eq user_params[:name].upcase
      user.reload
      expect(user.document).to eq user_params[:document]
    end
  end

  describe "DELETE /api/v1/users" do
    it "should destroy user" do
      delete :destroy, params: {id: user.id, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['email']).to eq user.email
      user = User.where(email: json['email']).first
      expect(user).to be_nil
    end
  end
end

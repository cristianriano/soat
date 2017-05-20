require 'rails_helper'

RSpec.describe VehiclesController do
  let(:admin) { create(:admin) }
  let(:user) { create(:confirmed_user) }
  let(:other_user) { create(:confirmed_user) }
  let(:vehicle) { create(:vehicle, user_id: user.id) }
  let(:vehicle_params) { attributes_for(:vehicle) }

  before(:each) do
    sign_in user
  end

  describe "POST /vehicles" do
    it "should create new vehicle by ajax" do
      post :create, params: {vehicle: vehicle_params, format: 'js'}
      expect(flash[:success]).not_to be_nil
      expect(Vehicle.where(vehicle_params).first).not_to be_nil
    end

    it "should not create without license" do
      post :create, params: {vehicle: {license: ""}, format: 'js'}
      expect(flash[:danger]).not_to be_nil
      expect(Vehicle.count).to be 0
    end

    it "should not create with invalid category" do
      post :create, params: {vehicle: {category: ""}, format: 'js'}
      expect(flash[:danger]).not_to be_nil
      expect(Vehicle.count).to be 0
    end

    it "should not create with invalid subcategory" do
      post :create, params: {vehicle: {subcategory: "xyz"}, format: 'js'}
      expect(flash[:danger]).not_to be_nil
      expect(Vehicle.count).to be 0
    end

    it "should not create with invalid age" do
      post :create, params: {vehicle: {age: -1}, format: 'js'}
      expect(flash[:danger]).not_to be_nil
      expect(Vehicle.count).to be 0
    end

    it "should not create with invalid category" do
      post :create, params: {vehicle: {category: "xyz"}, format: 'js'}
      expect(flash[:danger]).not_to be_nil
      expect(Vehicle.count).to be 0
    end

    it "should not create with invalid value_type" do
      post :create, params: {vehicle: {value_type: "xyz"}, format: 'js'}
      expect(flash[:danger]).not_to be_nil
      expect(Vehicle.count).to be 0
    end

    it "should not create with invalid value" do
      post :create, params: {vehicle: {value: -1}, format: 'js'}
      expect(flash[:danger]).not_to be_nil
      expect(Vehicle.count).to be 0
    end
  end

  describe "GET /vehicles/:id" do
    it "should show vehicle details to owner" do
      get :show, { id: vehicle.id }
      expect(flash[:danger]).to be_nil
      expect(response).to render_template(:show)
    end
  end
end

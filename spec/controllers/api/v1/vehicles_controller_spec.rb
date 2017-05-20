require 'rails_helper'

RSpec.describe Api::V1::VehiclesController do
  let(:vehicle_params) { attributes_for(:vehicle) }
  let(:vehicle) { create(:vehicle) }
  let(:vehicles) { create_list(:vehicle, 3) }
  # Display jsons
  render_views

  # Login to http basic auth
  include AuthHelper
  before(:each) do
    http_login
  end

  describe "GET /api/v1/vehicles" do
    it "should render all vehicles" do
      vehicles
      get :index, params: { format: 'json' }
      expect(response).to render_template(:index)
      json = JSON.parse(response.body)
      expect(json.count).to eq vehicles.count
    end
  end

  describe "GET /api/v1/vehicles/:id" do
    it "should show vehicle data" do
      get :show, params: { id: vehicle.id, format: 'json' }
      expect(response).to render_template(:show)
      json = JSON.parse(response.body)
      expect(json['id']).to eq vehicle.id
      expect(json['license']).to eq vehicle.license
    end
  end

  describe "POST /api/v1/vehicles" do
    it "should create vehicle" do
      post :create, params: {vehicle: vehicle_params, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['license']).to eq vehicle_params[:license]
      vehicle = Vehicle.find(json['id'])
      expect(vehicle).not_to be_nil
    end
  end

  describe "PATCH /api/v1/vehicles" do
    it "should edit vehicle" do
      patch :update, params: {id: vehicle.id, vehicle: vehicle_params, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['value']).to eq vehicle_params[:value]
      vehicle.reload
      expect(vehicle.license).to eq vehicle_params[:license]
    end
  end

  describe "DELETE /api/v1/vehicles" do
    it "should destroy vehicle" do
      delete :destroy, params: {id: vehicle.id, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['license']).to eq vehicle.license
      vehicle = Vehicle.where(license: json['license']).first
      expect(vehicle).to be_nil
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::InsurancesController do
  let(:insurance_params) { attributes_for(:insurance) }
  let(:insurance) { create(:insurance) }
  let(:vehicle) { create(:vehicle) }
  let(:insurances) { create_list(:insurance, 3) }
  # Display jsons
  render_views

  # Login to http basic auth
  include AuthHelper
  before(:each) do
    http_login
  end

  describe "GET /api/v1/insurances" do
    it "should render all insurances" do
      insurances
      get :index, params: { format: 'json' }
      expect(response).to render_template(:index)
      json = JSON.parse(response.body)
      expect(json.count).to eq insurances.count
    end
  end

  describe "GET /api/v1/insurances/:id" do
    it "should show insurance data" do
      get :show, params: { id: insurance.id, format: 'json' }
      expect(response).to render_template(:show)
      json = JSON.parse(response.body)
      expect(json['id']).to eq insurance.id
      expect(json['starts_at']).to eq insurance.starts_at.to_s
    end
  end

  describe "POST /api/v1/insurances" do
    it "should create insurance" do
      post :create, params: {insurance: {vehicle_id: vehicle.id}, format: 'json'}
      json = JSON.parse(response.body)
      insurance = Insurance.find(json['id'])
      expect(insurance).not_to be_nil
      expect(json['starts_at']).to eq insurance[:starts_at].to_s
    end
  end
end

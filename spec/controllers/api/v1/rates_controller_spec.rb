require 'rails_helper'

RSpec.describe Api::V1::RatesController do
  let(:rate_params) { attributes_for(:rate) }
  let(:rate) { Rate.all.sample }
  # Display jsons
  render_views

  # Login to http basic auth
  include AuthHelper
  before(:each) do
    http_login
  end

  describe "GET /api/v1/rates" do
    it "should render all rates" do
      get :index, params: { format: 'json' }
      expect(response).to render_template(:index)
      json = JSON.parse(response.body)
      expect(json.count).to eq Rate.count
    end
  end

  describe "GET /api/v1/rates/:id" do
    it "should show rate data" do
      get :show, params: { id: rate.id, format: 'json' }
      expect(response).to render_template(:show)
      json = JSON.parse(response.body)
      expect(json['id']).to eq rate.id
      expect(json['bonus']).to eq rate.bonus
    end
  end

  describe "POST /api/v1/rates" do
    it "should create rate" do
      post :create, params: {rate: rate_params, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['bonus']).to eq rate_params[:bonus]
      rate = Rate.find(json['id'])
      expect(rate).not_to be_nil
    end
  end

  describe "PATCH /api/v1/rates" do
    it "should edit rate" do
      patch :update, params: {id: rate.id, rate: rate_params, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['category']).to eq rate_params[:category]
      rate.reload
      expect(rate.bonus).to eq rate_params[:bonus]
    end
  end

  describe "DELETE /api/v1/rates" do
    it "should destroy rate" do
      rates_count = Rate.count
      delete :destroy, params: {id: rate.id, format: 'json'}
      json = JSON.parse(response.body)
      expect(json['bonus']).to eq rate.bonus
      expect(rates_count - 1).to eq Rate.count
    end
  end
end

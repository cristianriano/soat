require 'rails_helper'

RSpec.describe InsurancesController do
  let(:admin) { create(:admin) }
  let(:user) { create(:confirmed_user) }
  let(:other_user) { create(:confirmed_user) }
  let(:vehicle) { create(:vehicle, user_id: user.id) }
  let(:insurance_params) { {vehicle_id: vehicle.id} }
  let(:insurance) { create(:insurance, vehicle_id: vehicle.id) }

  before(:each) do
    sign_in user
  end

  describe "GET /insurances/new" do
    it "should render new insurance form" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST /insurances" do
    it "should create new insurance" do
      post :create, params: {insurance: insurance_params}
      expect(flash[:success]).not_to be_nil
      insurance = Insurance.where(insurance_params).first
      expect(insurance).not_to be_nil
      expect(response).to redirect_to(insurance_path(insurance))
    end

    it "should start insurance validity today" do
      post :create, params: {insurance: insurance_params}
      insurance = Insurance.where(insurance_params).first
      expect(insurance.starts_at.to_date).to eq Date.today
    end

    it "should start insurance when last one expires" do
      insurance
      post :create, params: {insurance: insurance_params}
      insurances = Insurance.where(insurance_params)
      expect(insurances.count).to eq 2
      insurance = insurances.first
      expect(insurance.starts_at.to_date).to eq (insurances.last.ends_at.to_date + 1.day)
    end

    it "should not allow buy insurance to not owned vehicles" do
      sign_in other_user
      post :create, params: {insurance: insurance_params}
      expect(flash[:danger]).not_to be_nil
      insurance = Insurance.where(insurance_params).first
      expect(insurance).to be_nil
      expect(response.redirect?).to be true
    end
  end

  describe "GET /insurances" do
    it "should not show insurances list to user" do
      get :index
      expect(flash[:danger]).not_to be_nil
      expect(response.redirect?).to be true
    end

    it "should show insurances index to admin" do
      sign_in admin
      get :index
      expect(flash[:danger]).to be_nil
      expect(response).to render_template(:index)
    end
  end

  describe "GET /insurances/:id" do
    it "should show insurance details to owner" do
      get :show, params: { id: insurance.id }
      expect(flash[:danger]).to be_nil
      expect(response).to render_template(:show)
    end

    it "should not show insurance to other user" do
      sign_in other_user
      get :show, params: { id: insurance.id }
      expect(flash[:danger]).not_to be_nil
      expect(response.redirect?).to be true
    end

    it "should show insurance to admin" do
      sign_in admin
      get :show, params: { id: insurance.id }
      expect(flash[:danger]).to be_nil
      expect(response).to render_template(:show)
    end

    describe "PDF" do
      render_views

      it "should show insurance pdf version" do
        get :show, params: { id: insurance.id, format: 'pdf' }
        expect(flash[:danger]).to be_nil
        expect(response.body).not_to be_nil
      end

      it "should not render nothing if insurance id don't exists" do
        get :show, params: { id: 100, format: 'pdf' }
        expect(flash[:danger]).not_to be_nil
        expect(response.redirect?).to be true
        expect(response.body).to have_content "redirected"
      end
    end
  end

  describe "GET /insurances/bought" do
    it "should show insurances bought" do
      get :bought
      expect(response).to render_template(:bought)
    end
  end
end

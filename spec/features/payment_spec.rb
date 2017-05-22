require 'rails_helper'

describe 'Payments' do
  let(:user) { create(:confirmed_user) }
  let(:admin) { create(:admin) }
  let(:vehicle_params) { attributes_for(:vehicle) }
  let(:vehicle) { create(:vehicle) }

  before(:each) do
    login_as user
    visit new_insurance_url
  end

  it 'registers new vehicle', :js do
    binding.pry
    fill_in "Placa", with: vehicle_params[:license]
    select(vehicle_params[:category], from: "Clase")
    select(vehicle_params[:subcategory], from: "Subtipo")
    fill_in "Edad", with: vehicle_params[:age]
    fill_in vehicle_params[:value_type], with: vehicle_params[:value]
    click_button('Registrar')
  end
end

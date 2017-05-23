require 'rails_helper'

describe 'Payments' do
  let(:user) { create(:confirmed_user) }
  let(:admin) { create(:admin) }
  let(:vehicle_params) { attributes_for(:vehicle) }
  let(:vehicle) { create(:vehicle) }

  before(:each) do
    login_as user
    visit new_insurance_path
  end

  it 'registers new vehicle', :js do
    expect(page).to have_selector('#insurance_section', visible: false)
    fill_in "Placa", with: vehicle_params[:license]
    select(vehicle_params[:category], from: "Clase")
    select(vehicle_params[:subcategory], from: "Subtipo")
    fill_in "Edad", with: vehicle_params[:age]
    fill_in vehicle_params[:value_type], with: vehicle_params[:value]
    click_button('Registrar')
    wait_for_ajax
    expect(page).to have_css "div.alert.alert-success"
    expect(Vehicle.where(vehicle_params).first).not_to be_nil
    # Vehicle form hided
    expect(page).to have_selector('#vehicle_section', visible: false)
    expect(page).to have_content I18n.t('insurances.new.insurance_not_found')
    expect(page).to have_selector('#insurance_section', visible: true)
  end
end

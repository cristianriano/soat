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

  it 'registers new vehicle' do
    
  end
end

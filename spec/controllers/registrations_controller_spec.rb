require 'rails_helper'

RSpec.describe RegistrationsController do
  let(:user_params) { attributes_for(:user) }

  describe "POST /user_registration" do
    # TODO Couldn't test creation thorugh Devise
    # it "should create new user" do
    #   post :create, params: {user: user_params}
    #   flash[:notice].should_not be_nil
    # end
  end
end

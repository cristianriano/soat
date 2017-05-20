require 'rails_helper'

RSpec.describe DashboardsController do
  let(:admin) { create(:admin) }
  let(:user) { create(:confirmed_user) }

  describe "GET /dashboard" do
    it "should render dashboard for logged user" do
      sign_in user
      get :show
      expect(response).to render_template(:show)
    end

    it "should render dashboard for admin" do
      sign_in admin
      get :show
      expect(response).to render_template(:show)
    end

    it "should redirect to home if not logged" do
      get :show
      expect(flash[:alert]).not_to be_nil
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

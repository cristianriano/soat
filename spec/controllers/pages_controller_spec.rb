require 'rails_helper'

RSpec.describe PagesController do
  let(:user) { create(:confirmed_user) }

  describe "GET /" do
    it "should render home page" do
      get :home
      expect(response).to render_template(:home)
    end

    it "should render dashboard if logged in" do
      sign_in user
      get :home
      expect(response).to redirect_to(dashboard_path)
    end
  end

  describe "GET /contact" do
    it "should render contact page" do
      get :contact
      expect(response).to render_template(:contact)
    end
  end

  describe "GET /about" do
    it "should render about page" do
      get :about
      expect(response).to render_template(:about)
    end
  end

end

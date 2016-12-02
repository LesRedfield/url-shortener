require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  describe "GET #new" do
    it "renders the new links page" do
      get :new, link: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the length of long_url" do
        post :create, link: { long_url: "short" }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the link show page" do
        post :create, link: { long_url: "https://www.uniteus.com/" }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    let(:link) { Link.create({ long_url: "www.uniteus.com" }) }

    it "redirects to long_url" do
      get :show, short_url: link.short_url

      expect(response).to redirect_to("www.uniteus.com")
    end
  end
end

require 'rails_helper'

RSpec.describe "Illustrations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/illustrations/index"
      expect(response).to have_http_status(:success)
    end
  end

end

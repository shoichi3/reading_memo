require 'rails_helper'

RSpec.describe 'Norms', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/norms/index'
      expect(response).to have_http_status(:success)
    end
  end
end

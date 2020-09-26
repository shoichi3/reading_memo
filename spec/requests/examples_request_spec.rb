require 'rails_helper'

RSpec.describe 'Examples', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/examples/index'
      expect(response).to have_http_status(:success)
    end
  end
end

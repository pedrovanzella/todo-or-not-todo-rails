require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  # POST /users
  describe 'POST /users' do
    context 'when user does not exist yet' do
      let(:user) { build(:user) }
      before { post '/users', params: attributes_for(:user) }

      it 'registers the user' do
        pending
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when user already exists' do
      let(:user) { create(:user) }
      before { post '/users', params: attributes_for(:user) }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        pending
      end
    end
  end
end

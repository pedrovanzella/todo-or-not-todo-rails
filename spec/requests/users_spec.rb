require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  # POST /users
  describe 'POST /users' do
    context 'when user does not exist yet' do
      let(:user) { build(:user) }
      before { post '/users', params: attributes_for(:user) }

      it 'registers the user' do
        expect(json[:email]).to eq(attributes_for(:user)['email'])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when user already exists' do
      let(:user) { create(:user) }
      before do
        post '/users', params: attributes_for(:user)
        post '/users', params: attributes_for(:user)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['errors']['email']).to eq(["has already been taken"])
      end

      it 'still has only one user on the database' do
        expect(User.all.count).to eq(1)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::AuthController, type: :controller do
  describe 'POST #login' do
    context 'with wrong parameters' do
      it 'must return unauthorized http status' do
        post :login, params: { auth: { email: 'runahr@demo.com', password: 'password' } }

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with correct parameters' do
      let!(:user) { create(:user) }

      before do
        user.update(password: 'demo123')
      end

      it 'must return success http status' do
        post :login, params: { auth: { email: user.email, password: 'demo123' } }

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE #logout' do
    context 'without any Header Authorization' do
      it 'must return unauthorized http status' do
        delete :logout

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with a wrong Header Authorization' do
      let(:headers) { { 'Authorization' => Faker::Crypto.sha1 } }

      it 'must return unauthorized http status' do
        request.headers.merge! headers
        delete :logout

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with a correct Header Authorization' do
      let(:user) { create(:user) }
      let(:session) { user.sessions.create }
      let(:headers) { { 'Authorization' => session.access_token } }

      it 'must return success http status' do
        request.headers.merge! headers
        delete :logout

        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #current_user_session' do
    context 'without any Header Authorization' do
      it 'must return unauthorized http status' do
        get :current_user_session

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with a wrong Header Authorization' do
      let(:headers) { { 'Authorization' => Faker::Crypto.sha1 } }

      it 'must return not_found http status' do
        request.headers.merge! headers
        get :current_user_session

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with a correct Header Authorization' do
      let(:user) { create(:user) }
      let(:session) { user.sessions.create }
      let(:headers) { { 'Authorization' => session.access_token } }

      it 'must return success http status' do
        request.headers.merge! headers
        get :current_user_session

        expect(response).to have_http_status(:success)
      end
    end
  end
end

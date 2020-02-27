# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  let(:main_user) { create(:user) }
  let!(:company) { main_user.company }
  let(:session) { main_user.sessions.create }
  let(:access_token) { session.access_token }
  let(:headers) { { 'Authorization' => access_token } }

  before do
    request.headers.merge!(headers)
  end

  describe 'GET #index' do
    context 'with a couple of users' do
      let!(:user_1) { create(:user, company: company) }
      let!(:user_2) { create(:user, company: company) }

      it 'must return success http status' do
        get :index
        body_response = JSON.parse(response.body)

        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(3)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #show' do
    context 'with correct params' do
      let!(:user) { create(:user, company: company) }

      it 'must return success http status' do
        get :show, params: { id: user.id }
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(5)
      end
    end
  end

  describe 'POST #create' do
    context 'with correct params' do
      let(:params) do
        {
          user: {
            first_name: 'User',
            last_name: 'Test',
            email: 'utest@demo.com',
            password: 'roadmapp'
          }
        }
      end

      it 'must return success http status' do
        post :create, params: params
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(5)
      end
    end

    context 'with invalid params' do
      let(:params) do
        {
          user: {
            first_name: '',
            last_name: '',
            email: 'utest@demo.com',
            password: 'roadmapp'
          }
        }
      end

      it 'must return success http status' do
        post :create, params: params
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(3)
        expect(body_response['errors'].count).to eq(2)
      end
    end
  end

  describe 'PUT #update' do
    context 'with correct params' do
      let!(:user) { create(:user, company: company) }
      let(:params) do
        {
          id: user.id,
          user: {
            first_name: 'New first name'
          }
        }
      end

      it 'must return success http status' do
        put :update, params: params
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(5)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let!(:company) { user.company }
  let(:session) { user.sessions.create }
  let(:access_token) { session.access_token }
  let(:headers) { { 'Authorization' => access_token } }

  before do
    request.headers.merge!(headers)
  end

  describe 'GET #index' do
    context 'with a couple of projects' do
      let!(:project_1) { create(:project, company: company) }
      let!(:project_2) { create(:project, company: company) }

      it 'must return success http status' do
        get :index
        body_response = JSON.parse(response.body)

        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(2)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #show' do
    context 'with correct params' do
      let!(:project) { create(:project, company: company) }

      it 'must return success http status' do
        get :show, params: { id: project.id }
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(9)
      end
    end
  end

  describe 'POST #create' do
    context 'with correct params' do
      let(:params) do
        {
          project: {
            name: 'Project Test 1',
            description: 'Test for create endpoint projects controller',
            init_date: '2020-02-28',
            end_date: '2020-07-28'
          }
        }
      end

      it 'must return success http status' do
        post :create, params: params
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(9)
      end
    end

    context 'with invalid params' do
      let(:params) do
        {
          project: {
            name: '',
            description: 'Test for create endpoint projects controller',
            init_date: '2020-07-28',
            end_date: '2020-02-28'
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
      let!(:project) { create(:project, company: company) }
      let(:params) do
        {
          id: project.id,
          project: {
            name: 'Project Test Update'
          }
        }
      end

      it 'must return success http status' do
        put :update, params: params
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body_response).not_to be_empty
        expect(body_response.count).to eq(9)
      end
    end
  end
end

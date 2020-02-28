# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::MembersController, type: :controller do
  let(:user) { create(:user) }
  let!(:company) { user.company }
  let(:session) { user.sessions.create }
  let(:access_token) { session.access_token }
  let(:headers) { { 'Authorization' => access_token } }

  before do
    request.headers.merge!(headers)
  end

  describe 'GET #index' do
    context 'with any members' do
      let(:project) { create(:project, company: company) }

      it 'must return success http status' do
        get :index, params: { project_id: project.id }
        body_response = JSON.parse(response.body)

        expect(body_response).to be_empty
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST #create' do
    context 'with an empty ids params' do
      let(:project) { create(:project, company: company) }
      let(:user_1) { create(:user) }
      let(:user_2) { create(:user) }
      let(:params) do
        {
          user: { ids: [user_1.id, user_2.id, 90] },
          project_id: project.id
        }
      end

      it 'must return success http status' do
        post :create, params: params
        body_response = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(body_response['success_members_number']).to eq(2)
        expect(body_response['failed_members_number']).to eq(1)
      end
    end
  end
end

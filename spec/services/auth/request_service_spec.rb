# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::RequestService, type: :module do
  let!(:active_user) { create(:user) }
  let!(:session) { active_user.sessions.create }
  let!(:expired_session) { active_user.sessions.create }

  before do
    expired_session.expire!
  end

  describe 'Handle behavior' do
    context 'wrong token' do
      let!(:wrong_access_token) { Faker::Crypto.sha1 }

      it 'must trigger an error' do
        request_service = Auth::RequestService.new(wrong_access_token)
        request_service.call

        expect(request_service.errors).to eq(['Invalid token.'])
      end
    end

    context 'empty token' do
      let!(:empty_access_token) { '' }

      it 'must trigger an error' do
        request_service = Auth::RequestService.new(empty_access_token)
        request_service.call

        expect(request_service.errors).to eq(['Invalid token.'])
      end
    end

    context 'null token' do
      let!(:null_access_token) { nil }

      it 'must trigger an error' do
        request_service = Auth::RequestService.new(null_access_token)
        request_service.call

        expect(request_service.errors).to eq(['Invalid token.'])
      end
    end

    context 'expired session' do
      it 'must trigger an error' do
        request_service = Auth::RequestService.new(expired_session.access_token)
        request_service.call

        expect(request_service.errors).to eq(['Session expired.'])
      end
    end

    context 'valid session' do
      it 'must return a user' do
        request_service = Auth::RequestService.new(session.access_token)
        request_service.call

        expect(request_service.errors).to be_empty
        expect(request_service.user).to be_a(User)
      end
    end
  end
end

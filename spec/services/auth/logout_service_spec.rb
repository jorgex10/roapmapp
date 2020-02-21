# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::LogoutService, type: :module do
  let!(:active_user) { create(:user) }
  let!(:session) { active_user.sessions.create }
  let!(:session_to_be_expired) { active_user.sessions.create }

  describe 'Handle behavior' do
    context 'wrong token' do
      let!(:wrong_access_token) { Faker::Crypto.sha1 }

      it 'must trigger an error' do
        logout_service = Auth::LogoutService.new(wrong_access_token)
        logout_service.call

        expect(logout_service.errors).to eq(['Invalid token.'])
      end
    end

    context 'empty token' do
      let!(:wrong_access_token) { '' }

      it 'must trigger an error' do
        logout_service = Auth::LogoutService.new(wrong_access_token)
        logout_service.call

        expect(logout_service.errors).to eq(['Invalid token.'])
      end
    end

    context 'null token' do
      let!(:wrong_access_token) { nil }

      it 'must trigger an error' do
        logout_service = Auth::LogoutService.new(wrong_access_token)
        logout_service.call

        expect(logout_service.errors).to eq(['Invalid token.'])
      end
    end

    context 'expired token' do
      it 'must trigger an error' do
        session_to_be_expired.expire!
        logout_service = Auth::LogoutService.new(session_to_be_expired.access_token)
        logout_service.call

        expect(logout_service.errors).to eq(['Session expired.'])
      end
    end

    context 'valid token' do
      it 'must expire session' do
        logout_service = Auth::LogoutService.new(session.access_token)
        logout_service.call

        expect(logout_service.errors).to be_empty
        expect(session.reload.expired?).to eq(true)
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::LoginService, type: :module do
  let!(:active_user) { create(:user) }

  describe 'Handle behavior' do
    let!(:valid_email) { active_user.email }
    let!(:password) { 'password' }

    before do
      active_user.update(password: 'password')
    end

    context 'empty email' do
      let!(:empty_email) { '' }

      it 'must trigger error' do
        login_service = Auth::LoginService.new(empty_email, password)
        login_service.call

        expect(login_service.errors).to eq(['Email can\'t be blank.'])
      end
    end

    context 'wrong email' do
      let!(:wrong_email) { 'asd@example.com' }

      it 'must trigger error' do
        login_service = Auth::LoginService.new(wrong_email, password)
        login_service.call

        expect(login_service.errors).to eq(['User is inactive.'])
      end
    end

    context 'null email' do
      let!(:null_email) { nil }

      it 'must trigger error' do
        login_service = Auth::LoginService.new(null_email, password)
        login_service.call

        expect(login_service.errors).to eq(['Email can\'t be blank.'])
      end
    end

    context 'empty password' do
      let!(:empty_password) { '' }

      it 'must trigger error' do
        login_service = Auth::LoginService.new(valid_email, empty_password)
        login_service.call

        expect(login_service.errors).to eq(['Password can\'t be blank.'])
      end
    end

    context 'wrong password' do
      let!(:wrong_password) { 'wrong_password' }

      it 'must trigger error' do
        login_service = Auth::LoginService.new(valid_email, wrong_password)
        login_service.call

        expect(login_service.errors).to eq(['Invalid credentials.'])
      end
    end

    context 'null password' do
      let!(:null_password) { nil }

      it 'must trigger error' do
        login_service = Auth::LoginService.new(valid_email, null_password)
        login_service.call

        expect(login_service.errors).to eq(['Password can\'t be blank.'])
      end
    end

    context 'correct email' do
      it 'must return session object' do
        login_service = Auth::LoginService.new(valid_email, password)
        login_service.call

        expect(login_service.errors).to be_empty
        expect(login_service.session).to be_a(Session)
      end
    end
  end
end

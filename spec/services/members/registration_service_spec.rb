# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Members::RegistrationService, type: :module do
  let!(:active_project) { create(:project) }
  let!(:inactive_project) { create(:project, :inactive) }
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }

  describe 'Handle behavior' do
    context 'with active project and empty user_id array' do
      it 'errors, success_members & failed_members must be empty' do
        registration_service = Members::RegistrationService.new({ ids: [] }, active_project)
        registration_service.call

        expect(registration_service.errors).to be_empty
        expect(registration_service.success_members).to be_empty
        expect(registration_service.failed_members).to be_empty
      end
    end

    context 'with inactive project' do
      it 'must trigger an error' do
        registration_service = Members::RegistrationService.new({ ids: [] }, inactive_project)
        registration_service.call

        expect(registration_service.errors).to eq(['Project is inactive.'])
      end
    end

    context 'with valid users' do
      let(:ids) { [user_1.id, user_2.id, user_3.id] }

      it 'must return array of users' do
        registration_service = Members::RegistrationService.new({ ids: ids }, active_project)
        registration_service.call

        expect(registration_service.errors).to be_empty
        expect(registration_service.success_members.count).to eq(3)
        expect(registration_service.success_members).to all(be_an(User))
        expect(registration_service.failed_members).to be_empty
      end
    end

    context 'with 2 valid users & 1 invalid user' do
      let(:ids) { [user_1.id, user_2.id, 99] }

      it 'must return failed and success members' do
        registration_service = Members::RegistrationService.new({ ids: ids }, active_project)
        registration_service.call

        expect(registration_service.errors).to be_empty
        expect(registration_service.success_members.count).to eq(2)
        expect(registration_service.success_members).to all(be_an(User))
        expect(registration_service.failed_members.count).to eq(1)
      end
    end

    context 'with all invalid users' do
      let(:ids) { [97, 98, 99] }

      it 'must return failed and success members' do
        registration_service = Members::RegistrationService.new({ ids: ids }, active_project)
        registration_service.call

        expect(registration_service.errors).to be_empty
        expect(registration_service.success_members.count).to eq(0)
        expect(registration_service.success_members).to be_empty
        expect(registration_service.failed_members.count).to eq(3)
      end
    end
  end
end

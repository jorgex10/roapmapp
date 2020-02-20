# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session, type: :model do
  let(:user) { create(:user) }
  let!(:session) { user.sessions.build }

  describe 'Attributes' do
    %w[
      access_token
      expires_at
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'Callbacks' do
    it 'should have access_token value' do
      session.save

      expect(session.access_token).to be_a(String)
    end

    it 'should have expires_at value' do
      session.save

      expect(session.expires_at).to be_a(ActiveSupport::TimeWithZone)
    end
  end

  describe 'Associations' do
    it { should belong_to(:user).required }
  end
end

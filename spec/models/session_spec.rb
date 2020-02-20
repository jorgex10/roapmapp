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
      expect{ session.save }.to change{ session.access_token }
    end

    it 'should have expires_at value' do
      expect{ session.save }.to change{ session.expires_at }
    end
  end

  describe "Associations" do
    it { should belong_to(:user).required }
  end
end

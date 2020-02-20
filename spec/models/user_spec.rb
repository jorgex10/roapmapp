# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Attributes' do
    %w[
      first_name
      last_name
      email
      status
      password_digest
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe "Validations" do
    let!(:user) { create(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'Associations' do
    it { should belong_to(:company) }
    it { should have_many(:sessions) }
    it { should have_many(:user_projects) }
    it { should have_many(:projects).through(:user_projects) }
  end

  describe 'Instance methods' do
    context "#full_name" do
      let!(:user) { create(:user) }

      it 'should return first_name and last_name' do
        expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
      end
    end
  end
end

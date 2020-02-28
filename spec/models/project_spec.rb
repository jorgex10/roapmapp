# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Attributes' do
    %w[
      name
      description
      status
      init_date
      end_date
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'Validations' do
    let!(:project) { create(:project) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:init_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'Associations' do
    it { should belong_to(:company).required }
    it { should have_many(:categories) }
    it { should have_many(:user_projects) }
    it { should have_many(:members).through(:user_projects).source(:user) }
  end
end

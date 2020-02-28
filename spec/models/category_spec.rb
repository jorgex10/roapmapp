# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Attributes' do
    %w[
      name
      description
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'Validations' do
    let!(:category) { create(:category) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'Associations' do
    it { should belong_to(:project) }
  end
end

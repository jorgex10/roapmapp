# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Attributes' do
    %w[
      name
      url
      address
      phone
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'Validations' do
    let!(:company) { create(:company) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:url) }
  end

  describe 'Associations' do
    it { should have_many(:projects) }
    it { should have_many(:users) }
  end
end

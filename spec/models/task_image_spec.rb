# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskImage, type: :model do
  describe 'Attributes' do
    %w[
      image_data
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'Validations' do
    let!(:task_image) { create(:task_image) }

    it { should validate_presence_of(:image_data) }
  end

  describe 'Associations' do
    it { should belong_to(:task) }
  end
end

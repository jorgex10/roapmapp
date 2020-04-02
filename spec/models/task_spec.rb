# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Attributes' do
    %w[
      name
      description
      status
    ].each do |attribute|
      it { is_expected.to have_attribute attribute }
    end
  end

  describe 'Validations' do
    let!(:task) { create(:task) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'Associations' do
    it { should belong_to(:group).optional }
    it { should belong_to(:category).optional }
    it { should belong_to(:owner).class_name('User').required }
    it { should have_many(:task_images) }
  end
end

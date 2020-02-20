# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProject, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end
end

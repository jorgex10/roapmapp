# frozen_string_literal: true

class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_uniqueness_of :user_id, scope: :project_id
end

# frozen_string_literal: true

module Members
  class RegistrationService
    attr_reader :user_ids, :project, :success_members, :failed_members, :errors

    def initialize(member_params, project)
      @user_ids = member_params[:ids]
      @project = project
      @success_members = []
      @failed_members = []
      @errors = []
    end

    def call
      return [] unless valid?

      add_members
      success_members
    end

    private

    def valid?
      valid_project? && active_project?
    end

    def valid_project?
      project_present = project.present?
      errors << 'Project not found' unless project_present

      project_present
    end

    def active_project?
      project_active = project&.active?
      errors << 'Project is inactive' unless project_active

      project_active
    end

    def add_members
      verify_valid_members
      return unless success_members.present?

      success_members.each do |user|
        project.user_projects.create(user: user)
      end
    end

    def verify_valid_members
      user_ids.each do |user_id|
        member = User.find_by(id: user_id)
        valid_for_be_member?(member) ? add_to_success_members(member) : add_to_failed_members(user_id)
      end
    end

    def valid_for_be_member?(member)
      member&.active?
    end

    def add_to_success_members(member)
      success_members << member
    end

    def add_to_failed_members(user_id)
      failed_members << {
        id: user_id,
        message: 'User does not exist or is inactive'
      }
    end
  end
end

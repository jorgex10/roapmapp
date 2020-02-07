# frozen_string_literal: true

module V1
  class MembersController < ApiV1Controller
    before_action :set_project

    def index
      if @project
        render json: @project.members, each_serializer: UserSerializer
      else
        render json: ErrorResponse.not_found(Project), status: :not_found
      end
    end

    def show; end

    def create
      registration_service = Members::RegistrationService.new(member_params, @project)
      registration_service.call

      errors = registration_service.errors
      if errors.present?
        render json: ErrorResponse.unprocessable_entity(registration_service), status: :unprocessable_entity
      else
        render json: @project, serializer: MemberRegistrationSerializer, service: registration_service
      end
    end

    private

    def member_params
      params.require(:user).permit(ids: [])
    end

    def set_project
      @project = Project.find_by(id: params[:project_id])
    end
  end
end

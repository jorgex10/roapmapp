# frozen_string_literal: true

module V1
  class MembersController < ApiV1Controller
    before_action :set_project
    before_action :set_member, only: %i[show]

    def index
      render json: @project.members, each_serializer: UserSerializer
    end

    def show
      render json: @member, serializer: UserSerializer
    end

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

    def set_member
      @member = @project.members.find_by(id: params[:id])
      render json: ErrorResponse.not_found(User), status: :not_found unless @member
    end

    def set_project
      @project = current_company.projects.find_by(id: params[:project_id])
      render json: ErrorResponse.not_found(Project), status: :not_found unless @project
    end
  end
end

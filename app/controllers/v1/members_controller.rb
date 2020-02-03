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

    def show
      # @project = Project.find_by(id: params[:id])
      # if @project
      #   render json: @project, serializer: ProjectSerializer
      # else
      #   render json: ErrorResponse.not_found(Project), status: :not_found
      # end
    end

    def create
      registration_service = Members::RegistrationService.new(members_params)
      render json: { success: registration_service }
      # if @project.save
      #   render json: @project, serializer: ProjectSerializer
      # else
      #   render json: ErrorResponse.unprocessable_entity(@project), status: :unprocessable_entity
      # end
    end

    private

    def members_params
      params.require(:user).permit(ids: [])
    end

    def set_project
      @project = Project.find_by(id: params[:project_id])
    end
  end
end

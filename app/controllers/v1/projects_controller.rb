# frozen_string_literal: true

module V1
  class ProjectsController < ApiV1Controller
    before_action :set_project, only: %i[show update]

    def index
      @projects = current_company.projects
      render json: @projects, each_serializer: ProjectSerializer
    end

    def show
      render json: @project, serializer: ProjectSerializer
    end

    def create
      @project = current_company.projects.new(project_params)
      if @project.save
        render json: @project, serializer: ProjectSerializer
      else
        render json: ErrorResponse.unprocessable_entity(@project), status: :unprocessable_entity
      end
    end

    def update
      @project.assign_attributes(project_params)
      if @project.save
        render json: @project, serializer: ProjectSerializer
      else
        render json: ErrorResponse.unprocessable_entity(@project), status: :unprocessable_entity
      end
    end

    private

    def project_params
      params.require(:project).permit(:name, :description, :init_date, :end_date)
    end

    def set_project
      @project = current_company.projects.find_by(id: params[:id])
      render json: ErrorResponse.not_found(Project), status: :not_found unless @project
    end
  end
end

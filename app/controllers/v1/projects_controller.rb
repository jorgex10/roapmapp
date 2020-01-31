# frozen_string_literal: true

module V1
  class ProjectsController < ApiV1Controller
    before_action :set_project, only: %i[show update]

    def index
      @projects = current_company.projects
      render json: @projects, each_serializer: ProjectSerializer
    end

    def show
      @project = Project.find_by(id: params[:id])
      if @project
        render json: @project, serializer: ProjectSerializer
      else
        render json: ErrorResponse.not_found(Project), status: :not_found
      end
    end

    def create
      @project = Project.new(project_params)
      @project.company = current_company
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
      @project = Project.find_by(id: params[:id])
    end
  end
end

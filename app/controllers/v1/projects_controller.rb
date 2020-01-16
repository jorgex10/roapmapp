# frozen_string_literal: true

module V1
  class ProjectsController < ApiV1Controller
    def index
      @projects = current_company.projects
      render json: @projects, each_serializer: ProjectSerializer
    end
  end
end

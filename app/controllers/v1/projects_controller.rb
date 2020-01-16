# frozen_string_literal: true

module V1
  class ProjectsController < ApiV1Controller
    def index
      @projects = Project.all
      render json: @projects, each_serializer: ProjectSerializer
    end
  end
end

# frozen_string_literal: true

module V1
  class ProjectsController < ApiV1Controller
    def index
      @projects = Project.all
    end
  end
end

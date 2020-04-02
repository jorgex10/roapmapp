# frozen_string_literal: true

module V1
  class TasksController < ApiV1Controller
    before_action :set_project

    def create
      @task = Task.new(task_params)

      if @task.save
        render json: @task, serializer: TaskSerializer
      else
        render json: ErrorResponse.unprocessable_entity(@task), status: :unprocessable_entity
      end
    end

    private

    def task_params
      params.require(:task).permit(:name, :description, :group_id, :category_id, :owner_id, task_images_attributes: %i[id image_data _destroy])
    end

    def set_project
      @project = current_company.projects.find_by(id: params[:project_id])
      render json: ErrorResponse.not_found(Project), status: :not_found unless @project
    end
  end
end

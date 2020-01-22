# frozen_string_literal: true

module V1
  class UsersController < ApiV1Controller
    def index
      @users = current_company.users
      render json: @users, each_serializer: UserSerializer
    end
  end
end

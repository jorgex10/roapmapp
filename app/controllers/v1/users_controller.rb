# frozen_string_literal: true

module V1
  class UsersController < ApiV1Controller
    before_action :set_user, only: %i[show update]

    def index
      @users = current_company.users
      render json: @users, each_serializer: UserSerializer
    end

    def show
      render json: @user, serializer: UserSerializer
    end

    def create
      @user = current_company.users.new(user_params)
      if @user.save
        render json: @user, serializer: UserSerializer
      else
        render json: ErrorResponse.unprocessable_entity(@user), status: :unprocessable_entity
      end
    end

    def update
      @user.assign_attributes(user_params)
      if @user.save
        render json: @user, serializer: UserSerializer
      else
        render json: ErrorResponse.unprocessable_entity(@user), status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def set_user
      @user = current_company.users.find_by(id: params[:id])
      render json: ErrorResponse.not_found(User), status: :not_found unless @user
    end
  end
end

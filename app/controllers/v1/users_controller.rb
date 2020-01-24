# frozen_string_literal: true

module V1
  class UsersController < ApiV1Controller
    def index
      @users = current_company.users
      render json: @users, each_serializer: UserSerializer
    end

    def show
      @user = User.find_by(id: params[:id])
      if @user
        render json: @user, serializer: UserSerializer
      else
        render json: { errors: 'User not found.', code: 404 }, status: :not_found
      end
    end

    def create
      @user = User.new(user_params)
      @user.company = current_company
      if @user .save
        render json: @user, serializer: UserSerializer
      else
        render json: { errors: @user.errors.full_messages, code: 422 }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
  end
end

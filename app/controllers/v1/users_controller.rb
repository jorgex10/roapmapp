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
        render json: ErrorResponse.not_found(User), status: :not_found
      end
    end

    def create
      @user = User.new(user_params)
      @user.company = current_company
      if @user.save
        render json: @user, serializer: UserSerializer
      else
        render json: ErrorResponse.unprocessable_entity(@user), status: :unprocessable_entity
      end
    end

    def update
      @user = User.find_by(id: params[:id])
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
  end
end

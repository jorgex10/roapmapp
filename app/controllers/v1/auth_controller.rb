# frozen_string_literal: true

module V1
  class AuthController < ApiV1Controller
    def login
      auth_service = Auth::AuthUser.new(login_params[:email], login_params[:password])
      auth_service.call
      errors = auth_service.errors
      if errors.empty?
        render json: auth_service.session, serializer: SessionSerializer
      else
        render json: { errors: errors, code: 401 }, status: :unauthorized
      end
    end

    def logout
      puts 'TO-DO LOGOUT'
    end

    private

    def login_params
      params.require(:auth).permit(:email, :password)
    end
  end
end

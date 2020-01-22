# frozen_string_literal: true

module V1
  class AuthController < ApiV1Controller
    skip_before_action :authenticate_request, only: %i[login]

    def login
      login_service = Auth::AuthLogin.new(login_params[:email], login_params[:password])
      login_service.call
      errors = login_service.errors

      if errors.empty?
        render json: login_service.session, serializer: SessionSerializer
      else
        render json: { errors: errors, code: 401 }, status: :unauthorized
      end
    end

    def logout
      logout_service = Auth::AuthLogout.new(header_authorization)
      logout_service.call
      errors = logout_service.errors

      if errors.empty?
        render json: { success: true, code: 200 }
      else
        render json: { errors: errors, code: 401 }, status: :unauthorized
      end
    end

    def current_user_session
      render json: current_user, serializer: UserSerializer
    end

    private

    def login_params
      params.require(:auth).permit(:email, :password)
    end

    def header_authorization
      @header_authorization ||= request.headers['Authorization']
    end
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :auth, only: %i[] do
      collection do
        post :login
        delete :logout
        get :current_user_session
      end
    end
    resources :projects
    resources :users
  end
end

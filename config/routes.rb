# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :auth, only: %i[] do
      collection do
        post :login
        delete :logout
      end
    end
    resources :projects, only: %i[index]
    resources :users
  end
end

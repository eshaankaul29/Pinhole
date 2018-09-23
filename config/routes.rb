# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'auglis#new'
  resources :auglis, only: [:create]
  get 'image', to: 'auglis#show_image'
end

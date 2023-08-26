# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dinosaurs
  resources :cages

  root 'cages#index'
end

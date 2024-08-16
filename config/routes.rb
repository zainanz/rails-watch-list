Rails.application.routes.draw do
  root "lists#index"
  resources :lists, only: [:show, :new, :create, :edit, :update, :destroy ] do
    resources :bookmarks, shallow: true
  end
end

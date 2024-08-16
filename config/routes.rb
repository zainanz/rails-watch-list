Rails.application.routes.draw do
  root "lists#index"
  resources :lists, only: [:show, :new, :create, :edit, :update ] do
    resources :bookmarks, shallow: true
  end
end

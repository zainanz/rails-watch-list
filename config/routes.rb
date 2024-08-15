Rails.application.routes.draw do
  resources :lists, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :bookmarks, shallow: true
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # index, show, new, create
  resources :cocktails, except: %[:destroy :index] do
    resources :doses, only: %i[create new]
  end
  resources :doses, only: [:destroy]
  root 'cocktails#index'
end

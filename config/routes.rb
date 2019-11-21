Rails.application.routes.draw do
  get 'reservation/create'
  resources :rooms do
    member do
      get 'listing','pricing','description','photos','amenities','location','preload','preview'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end

  resources :users, only: [:show]
  root 'pages#home'
  devise_for :users,
              path:'',
              controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
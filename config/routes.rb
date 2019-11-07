Rails.application.routes.draw do
  resources :rooms do
    member do
      get 'listing','pricing','description','photos','amenities','location'
    end
  end

  resources :users, only: [:show]
  root 'pages#home'
  devise_for :users,
              path:'',
              controllers: { registrations: 'registrations', omniauth_callbacks: 'omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
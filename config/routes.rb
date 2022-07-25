Rails.application.routes.draw do
  resources :portions
  resources :contract_historics
  resources :contracts
  devise_for :users
  root to: 'pages#home'

  get 'user/home', to: "pages/private_user#index"
  get 'user/contract', to: "pages/private_user#contract"
  get 'user/income', to: "pages/private_user#income"
  get 'user/management', to: "pages/private_user#user_management"
end
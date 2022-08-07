Rails.application.routes.draw do
  resources :incomes
  resources :portions
  resources :contract_historics
  resources :contracts
  devise_for :users, controllers: { sessions: "users/sessions"}
  root to: 'pages#home'

  get 'user/home', to: "pages/private_user#index"
  get 'user/contract/:id', to: "pages/private_user#contract"
  get 'user/income', to: "pages/private_user#income"
  get 'user/management', to: "pages/private_user#user_management"
  
  get 'user/income_new', to: "pages/private_user#income_new"
  #post 'user/income_create', to: "pages/private_user#income_create"
  
  get 'user/admin_new', to: "pages/private_user#admin_new"
  post 'user/admin_create', to: "pages/private_user#admin_create"
  
  get 'user/contract_new', to: "pages/private_user#contract_new"
  #post 'user/contract_create', to: "pages/private_user#contract_create"

  get 'user/list', to: "pages/private_user#list_user"
  
  get 'user/edit/:id', to: "pages/private_user#edit_user"

  #get 'user/extrato/:id', to: "pages/private_user#insert_extrato_user"
  
  get 'user/manager/:id', to: "pages/private_user#manager_portion_user"
end
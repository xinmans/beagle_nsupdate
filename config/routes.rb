BeagleNsupdate::Application.routes.draw do
  devise_for :users do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  get "dashboard/index", :as => :user_root

  resources :groups do
    resources :zones
  end

  resources :zones do
    resource :group
    get :all_records, :on => :member
  end

  match 'zones/:id/bulk_delete_records' => 'zones#bulk_delete_records', :via => :delete
  match 'zones/:id/add_records' => 'zones#add_records', :via => :post

  root :to => "dashboard#index"

#  match ':controller(/:action(/:id(.:format)))'
end

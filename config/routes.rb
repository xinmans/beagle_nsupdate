BeagleNsupdate::Application.routes.draw do
  devise_for :users

  get "dashboard/index", :as => :user_root

  resources :groups do
    resources :zones
  end

  resources :zones do
    resource :group
    get :all_records, :on => :member
    delete :bulk_destroy, :on => :collection
    post :bulk_insert, :on => :collection
  end

  match 'zones/:id/bulk_delete_records' => 'zones#bulk_delete_records', :via => :delete
  match 'zones/:id/add_record' => 'zones#add_record', :via => :post
  match 'zones/:id/bulk_add_records' => 'zones#bulk_add_records', :via => :post

  root :to => "dashboard#index"

#  match ':controller(/:action(/:id(.:format)))'
end

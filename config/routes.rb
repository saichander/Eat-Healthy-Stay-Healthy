Rails.application.routes.draw do
  get 'food_records/new'

  get 'food_records/index'

  get 'food_records/edit'

  devise_for :users

  get 'user/body_metric/new' => 'body_metrics#new', as: :new_body_metric
  post 'user/body_metrics' => 'body_metrics#create',as: :create_body_metric
  get 'user/body_metric/:id/edit' => 'body_metrics#edit', as: :edit_body_metric

  get '/food_items/new' => 'food_items#new', as: :new_food_item
  post '/food_items' => 'food_items#create', as: :create_food_item
  get '/food_items' => 'food_items#index', as: :food_items

  get 'user/food_records/new' => 'food_records#new', as: :new_food_record
  post 'user/food_records' => 'food_records#create',as: :create_food_record
  get 'user/food_records' => 'food_records#index', as: :user_food_record
  get 'user/food_records/:id/edit' => 'food_records#edit', as: :edit_food_record
  patch 'user/food_records/:id' => 'food_records#update',as: :update_food_record
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'dynamic_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

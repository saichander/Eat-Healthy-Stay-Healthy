Rails.application.routes.draw do
  devise_for :users

  get '/body_metric/new' => 'body_metrics#new', as: :new_body_metric
  post '/body_metrics' => 'body_metrics#create',as: :create_body_metric
  get '/body_metric/edit' => 'body_metrics#edit', as: :edit_body_metric
  patch '/body_metrics' => 'body_metrics#update', as: :update_body_metric

  get '/food_items/new' => 'food_items#new', as: :new_food_item
  post '/food_items' => 'food_items#create', as: :create_food_item
  get '/food_items' => 'food_items#index', as: :food_items
  get 'food_items/:id/edit' => 'food_items#edit', as: :edit_food_item
  patch 'food_items/:id' => 'food_items#update', as: :update_food_item
  delete 'food_items/:id' => 'food_items#destroy',as: :destroy_food_item

  get '/food_records/new' => 'food_records#new', as: :new_food_record
  post '/food_records' => 'food_records#create',as: :create_food_record
  get '/food_records' => 'food_records#index', as: :user_food_record
  get '/food_records/:id/edit' => 'food_records#edit', as: :edit_food_record
  patch '/food_records/:id' => 'food_records#update',as: :update_food_record
  delete '/food_records/:id' => 'food_records#destroy',as: :destroy_food_record
  get '/food_records/log' => 'food_records#check_log',as: :check_log
  post '/food_records/log' => 'food_records#search_log', as: :search_log

  get '/workouts/new' => 'workouts#new', as: :new_workout
  post '/workouts' => 'workouts#create',as: :create_workout
  get '/workouts' => 'workouts#index',as: :workouts
  get '/workouts/:id/edit' => 'workouts#edit',as: :edit_workout
  patch '/workouts' => 'workouts#update',as: :update_workout
  delete '/workouts/:id' => 'workouts#destroy',as: :destroy_workout
  post 'workouts/search' => 'workouts#search',as: :search_video
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

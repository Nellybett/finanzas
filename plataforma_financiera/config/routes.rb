PlataformaFinanciera::Application.routes.draw do




  resources :requests

  root :to => 'Home#principal'

  get "home/index"
  get "users/login"
  match "/users/change_passwords" => "Users#change_password"
  match "/users/forgot_passwords" => "Users#forgot_password"
  match "/users/logins" => "Users#login"
  get "home/principal"
  get "home/index" => "Home#index"
  match "/income_eps/new.:id/" => "Income_eps#new"
  match "/income_events/new.:id/" => "Income_events#new"
  match "/income_tns/new.:id/" => "Income_tns#new"
  match "/egress_events/new.:id/" => "Egress_events#new"
  match "/users/logout" => "Users#logout"
  match "/users/signups" => "Users#signup"
  get "users/forgot_password"
  get "users/change_password"
  get "users/signup"
  resources :income_tns

  resources :income_eps
  resources :egress_events

  resources :income_events

  resources :egresses

  resources :incomes
  resources :events

  resources :eps

  resources :tns

  resources :users


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

RaggedWing::Application.routes.draw do

  resources :campaigns 
  resources :lists

  resources :organizations

  # Members Controller Mappings
  resources :members

  # Event Controller Mappings
  match 'events/filter' => 'events#filter'
  resources :events
  
  # Donation Controller Mappings
  match 'donations/search_by_amount' => 'donations#search_by_amount'
  match 'donations/search_by_amount_range' => 'donations#search_by_amount_range'
  match 'donations/search_by_date_range' => 'donations#search_by_date_range'
  match 'donations/filter_donations' => 'donations#filter_donations'
  match 'donations/download' => 'donations#download'
  match 'donations/upload' => 'donations#upload'
  resources :donations

  resources :notes
  
  # People Controller Mappings
  match 'people/filter' => 'people#filter'
  match 'people/search' => 'people#search'
  match 'people/auto'
  match 'people/download' => 'people#download'
  match 'people/upload' => 'people#upload'
  resources :people

  # for login
  resources :users do
    resource :additional_info
  end
  
  resource :session

  get "home/index"

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

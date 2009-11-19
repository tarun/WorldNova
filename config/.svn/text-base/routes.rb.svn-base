ActionController::Routing::Routes.draw do |map|    

  # Paths for Manage 
  map.resources :users, :path_prefix => 'manage', :controller => 'manage/users'
  map.resources :accounts, :path_prefix => 'manage', :controller => 'manage/accounts'
  map.resources :pictures, :path_prefix => 'manage', :controller => 'manage/pictures'
  map.resources :images, :path_prefix => 'manage', :controller => 'manage/images'
  map.resources :nominations, :path_prefix => 'manage', :controller => 'manage/nominations'
  map.resources :ratings, :path_prefix => 'manage', :controller => 'manage/ratings'

  # Admin Paths
  map.resources :categories, :path_prefix => 'admin', :controller => 'admin/categories'
  map.resources :contests, :path_prefix => 'admin', :controller => 'admin/contests'  do |contest|
    contest.resources :categories, :controller => 'admin/categories'
  end

  # Sessions - User login/logout
  map.resources :sessions  
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.register 'register', :controller => 'manage', :action => 'signup'


  # Contests Mapping
  map.connect '/contests/categories', :controller => 'contests', :action => 'categories'
  map.connect '/contests', :controller => 'contests', :action => 'index'
  map.connect '/contests/:contest_id', :controller => 'contests', :action => 'show'
  map.connect '/contests/:contest_id/categories', :controller => 'contests', :action => 'show'
  map.connect '/contests/:contest_id/categories/:category_id', :controller => 'contests', :action => 'show'
  map.connect '/contests/:contest_id/categories/:category_id/pictures', :controller => 'pictures', :action => 'show'
  map.connect '/contests/:contest_id/pictures', :controller => 'pictures', :action => 'show'

  # Pictures Mapping
  map.connect '/pictures', :controller => 'pictures', :action => 'index'
  map.connect '/pictures/:id', :controller => 'pictures', :action => 'show'

  # Info and other almost static pages
  map.home '', :controller => 'main', :action => 'index'
  map.about 'about', :controller => 'main', :action => 'about'
  map.contact 'contact', :controller => 'main', :action => 'contact'
  map.help 'help', :controller => 'main', :action => 'help'

  #map.home 'index.html'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

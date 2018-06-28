Rails.application.routes.draw do
 



  get 'permissions/new'

get 'users/new'

get 'soldiers/new'

get 'vehicles/new'

#-------------- Landing Page With Regristration and Login Routes
root 'sessions#new'
get 'Convoy-Commander' => 'sessions#new'
post 'users/new' => 'sessions#make_user'
post 'login'=> 'sessions#login'
get 'convoy' => 'convoys#convoy_page'
#-------------- Convoy Page 
post 'convoys' => 'convoys#create_convoy'
get 'convoy/:id' => 'convoys#specefic_convoy'
get 'delete_convoy/:id' => 'convoys#delete'
#-------------- Plans
post 'plans/:id' => 'plans#update_plan'
#-------------- Vehicles
post "vehicles/:id" => "vehicles#create"
post "vehicle_update/:id" => "vehicles#update"

#-------------- Soldiers
post "soldiers/:id" => "soldiers#create"
get "soldier_destroy/:id" => "soldiers#delete"

#-------------- Users
get "user/:id" => "users#show"

#-------------- Permissions
get "permission_start/:id" => "permissions#update"
get "permission_view/:id" => "permissions#update_view"



#-------------- Normal Restful Routes
#get "products" => "products#index"            #A page that displays all the products.
#get "products/new" => "products#new"          #A page that allows the user to add a new product
#post "products" => "products#create"          #A URL that processes information submitted from the new page to create a product        
#get "products/:id" => "products#show"         #A page that displays information for the product with an id of 2
#get "products/:id/edit" => "products#edit"    #A page that allows the user to edit existing product information
#patch "products/:id" => "products#update"     #A URL that processes information submitted from the edit page to update a product
#delete "products/:id" => "products#destroy"   #A URL that allows a product to be deleted

#get "json" => "products#json"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

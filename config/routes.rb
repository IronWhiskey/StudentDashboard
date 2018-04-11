Rails.application.routes.draw do

  resources :dojos do
    resources :students
  end

  root "dojos#main"
  get "dojos/new" => "dojos#showForm", as: "showDojoForm"
  post "create" => "dojos#create", as: "makeNew"
  get "dojos/:dojo_id" => "dojos#show", as: "showDojo"
  get "dojos/:dojo_id/edit" => "dojos#edit", as:  "editDojo"
  patch "dojos/:id" => "dojos#updateDojo",  as: "updateDojo"
  delete "dojos/:id" => "dojos#destroy", as: "destroyDojo"


  get "students" => "students#index"
  get "students/new/" => "students#new", as: "addStudent"
  post "students" => "students#create", as: "newStudent"
  get "students/:id" => "students#show", as: "showStudent"
  get "students/:id/edit" => "students#edit", as: "editStudent"
  patch "students/:id" => "students#update"
  delete "students/:id" => "students#destroy"

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

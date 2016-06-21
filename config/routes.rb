Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/' => 'home#index'
  get 'notice/index'
  get 'home/index'
  get 'teambuilding_list/index'
  get 'teambuild' => 'teambuilding_create#index'
  get 'teambuilding_choose/choose'
  get 'teambuilding_create/create'
  get 'teambuilding_create/delete/:id' => 'teambuilding_create#delete'
  get 'teambuilding_create/update/:id' => 'teambuilding_create#update'
  get 'teambuilding_choose/destroy/:post_id' => 'teambuilding_choose#destroy'
 
  get 'mypage/index'
  get 'mypage' => 'mypage#index'
  get 'teambuilding_choose/choose/:id' => 'teambuilding_choose#choose'
  
  post 'teambuilding_choose/write'
  post 'teambuilding_choose/replypost'
  post 'teambuilding_choose/replyreply'
  post 'teambuilding_create/apply'
  post 'teambuilding_create/create'
  
  
  post 'notice/write'
  get 'notice/write_input'
  get 'notice/read/:post_id' => 'notice#read'
  get 'notice/delete/:post_id' => 'notice#delete'
  get 'notice/update_view/:post_id' => 'notice#update_view'
  post 'notice/update/:post_id' => 'notice#update'

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

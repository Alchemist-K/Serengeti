Rails.application.routes.draw do
  root 'home#index'
  mount Ckeditor::Engine => '/ckeditor'
  get 'admin/index'
  resources :teams, except: [:show, :index]
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
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
  post 'teambuilding_choose/destroyreply/:id' => 'teambuilding_choose#destroyreply', as: :teambuilding_choose_destroyreply
  get 'teambuilding_choose/:id' => 'teambuilding_choose#index'

  get 'mypage/index'
  get 'mypage' => 'mypage#index'
  get 'mypage/index/accept/:request_id' => 'mypage#accept'
  get 'mypage/index/deny/:request_id' => 'mypage#deny'
  get 'teambuilding_choose/choose/:id' => 'teambuilding_choose#choose'
  get 'teambuilding_choose/:id' => 'teambuilding_choose#index'
  get 'teambuilding_choose/index/:id' => 'teambuilding_choose#index'

  post 'teambuilding_choose/write'
  post 'teambuilding_choose/replypost/:id' => 'teambuilding_choose#replypost'
  post 'teambuilding_choose/replypost'
  post 'teambuilding_choose/replyreply'
  post 'teambuilding_create/apply/:id' => 'teambuilding_create#apply'
  post 'teambuilding_create/create'

  post 'teambuilding_create/apply'
  post 'teambuilding_create/create_process'
  post 'teambuilding_create/update_process/:id' => 'teambuilding_create#update_process'


  post 'notice/write'

  get 'teambuilding_list/tag_search'
  post 'teambuilding_list/tag_search'
  post 'teambuilding_list/search'
  get 'teambuilding_list/timedesc'
  get 'teambuilding_list/timeasc'

  get 'notice/write_input'
  get 'notice/read/:post_id' => 'notice#read'
  get 'notice/delete/:post_id' => 'notice#delete'
  get 'notice/update_view/:post_id' => 'notice#update_view'
  post 'notice/update/:post_id' => 'notice#update'
  post 'notice/reply_write'
  post 'notice/reply_delete'
  post 'home/get_userinform' => 'home#get_userinform', as: :home_get_userinform
  post 'home/get_userinformwithphone/:user_id' => 'home#get_userinformwithphone', as: :home_get_userinformwithphone



  get 'mypage/member' => 'mypage#member'
  get 'mypage/myinfo' => "mypage#myinfo"
  get 'admin/index'
  get 'admin/destroy/:id' => 'admin#destroy'
  post 'admin/feedback' => "admin#feedback"
  get 'admin/feedback' => "admin#feedback"
  get 'admin/team'
  get 'admin/teambuild'
  post 'mypage/feedback'


  get 'home/confirm_please'

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

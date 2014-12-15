Rails.application.routes.draw do

  root 'categories#index'

  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

  get 'inquiry/:id/accept' => 'inquiry#accept',as: 'inquiry_accept'
  post 'inquiry/accept_thanks' => 'inquiry#accept_thanks'  

  devise_for :hairdressers
  # to redirect dvise from using its own hidden sessions controller, in order to implement ajax
  devise_for :users
  
  resources :pictures, only: [:index, :show, :new, :create , :update, :destroy]

  resources :users, only: [:index, :update, :show, :new, :create , :destroy]

  # resources :user_sessions, only: [:new, :create , :destroy]
  #which category resourse should we use???
  resources :categories, only: [:index, :new, :create , :destroy, :show]

  resources :hairdressers, only: [:index, :show,:update,] do 
    resources :reviews, only: [:show, :new, :create , :destroy]
  end

  # get 'login' => 'user_sessions#new', as: 'login'
  # get 'logout' => 'user_sessions#destroy', as: 'logout'

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

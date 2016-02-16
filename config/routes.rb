Rails.application.routes.draw do

  get 'explora' => 'pages#guest', as: :explora
  get 'home' => 'pages#index', as: :home


  devise_for :users
  resources :mailboxes, only: [:index]
  resources :mailboxer_conversations do
    member do
      post :reply
      post :restore
    end

    collection do 
      delete :empty_trash
    end
  end

  get 'mailbox/inbox' => 'mailboxes#inbox', as: :mailbox_inbox
  get 'mailbox/sent' => 'mailboxes#sent', as: :mailbox_sent
  get 'mailbox/trash' => 'mailboxes#trash', as: :mailbox_trash

  resources :comments
  resources :image_posts do 
    resources :comments,only: [:create]
  end

  resources :text_posts do 
    resources :comments,only: [:create]
  end
  
  resources :posts

  resources :users do 
    resources :profiles
    resources :photos
    
    member do 
      post :follow
      delete :unfollow
    end
  end

  root 'posts#index'
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

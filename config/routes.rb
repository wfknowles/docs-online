Rails.application.routes.draw do
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
  
  resources :stickies
  resources :jobs
  resources :documents
  resources :reports
  resources  :notes
  resources :events, :path => "shifts"
  get 'home/index'
  get '/providers/history',to: 'providers#history',as: :providers_history
  post '/providers/:id/undo', to: 'providers#undo', as: :undo
  #get '/sites/history',to: 'sites#history',as: :sites_history
  #post '/sites/:id/undo', to: 'sites#undo', as: :undo
  root 'home#index'
  get '/settings', to: 'pages#settings'
  get '/dashboard', to: 'dashboard#index'
  get '/shift',to: 'events#list',as: :events_list
  devise_for :users
  resources :users
  resources :providers do
    collection {post :import}
  end
  resources :sites do
    collection {post :import}
  end
  
  #resource :events do
   # collection {post :import}
  #end
  
 
  
   resource :providers do
    collection do
      get 'note'
    end
  end
  
   resource :sites do
    collection do
      get 'note'
    end
  end
  
  resource :events do
    collection do
      get 'note'
    end
  end
  
  resources :posts
  resources :uploads, only: [:create, :destroy]

  get '/editor/index'
  # :action is deprecated by 5.2, we need to find alternative
  get ':action', :controller => "editor"
  get '/export',to: 'events#export',as: :events_export
end

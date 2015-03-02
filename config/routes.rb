Edas::Application.routes.draw do


  # Тест майлера
  get 'testmailer' => 'pages#test'

  # Админка
  namespace :admin do
    # get 'admin' => "admin#index"
    
    root "admin#index"
    resources :users
    resources :microposts
    resources :services
    resources :tags
    resources :projects
  end

  # Странички

  root 'pages#home'

# УСЛУГИ
  get 'tools' => 'pages#tools', as: :tools
  # ИМЕНОВАННЫЙ МАРШРУТ для перехода на просмотр  услуги
  get 'tools/:id' => 'pages#tools', as: :tools_view

  get 'projects' => 'pages#projects'
  get 'contacts' => 'pages#contacts'
  get 'about'    => 'pages#about'
  get 'news'     => 'pages#news'
  get 'docs'     => 'pages#docs'

  # get 'news/:id' => 'pages#news', as: :news_view

  # Превь markdown
  post "markdown/preview"

  # post '/tinymce_assets' => 'tinymce_assets#create'
  
  # страницы с услугами( кроме основных будут предоставлены и прочие)
  # автоматизация
  
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

Rails.application.routes.draw do
  resources :refs
  resources :references
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => { :registrations => "user_registrations" }
  resources :users
 
  post 'payments/create' => 'payments#create'

  resources :projects do
    resources :comments
    collection do
      get :index
    end
  end

  resources :events do
  end

  resources :references do
  end


  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/index_by_date'

  get 'static_pages/index_by_artist'

  get 'static_pages/references'

  get 'static_pages/landing_page'
  
  get 'static_pages/events'

  get 'static_pages/landing_page'
  post 'static_pages/thank_you'

root 'static_pages#landing_page'

resources :orders, only: [:index, :show, :create, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

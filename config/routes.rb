Rails.application.routes.draw do
    resources :movies
    root :to => redirect('/movies')
    
    get  'auth/:provider/callback' => 'sessions#create'
    post 'logout' => 'sessions#destroy'
    get  'auth/failure' => 'sessions#failure'
    get 'auth/twitter', :as => 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

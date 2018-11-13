Rails.application.routes.draw do
    
    resources :movies do
        resources :reviews
    end
    root :to => redirect('/movies')
    
    get  'auth/:provider/callback' => 'sessions#create'
    post 'logout' => 'sessions#destroy'
    get  'auth/failure' => 'sessions#failure'
    get  'auth/twitter', :as => 'login'
    
    post '/movies/search_tmdb'
    post  '/movies/add_tmdb/:id' => 'movies#add_tmdb'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

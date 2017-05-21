Rails.application.routes.draw do

  root 'pages#home'
  
  devise_for 	:users, 
  						:path => '', 
  						:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  						:controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  						                  :registrations => 'registrations'
  					                  	}
  						                
            #creates shortcuts to access pages without having to type full path name e.g/users/login
            #allows users to edit information on their profile


  resources :users, only: [:show] #only one path in rake routes
  resources :rooms #multiple paths in rake routes
  resources :photos
  
  resources :rooms do
    resources :reservations, only: [:create] #stops users updating/destroying reservation
  end
  
  get '/preload' => 'reservations#preload'
  get '/preview' => 'reservations#preview'
  
  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'
  
  get '/search' => 'pages#search'

end 
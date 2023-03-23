Rails.application.routes.draw do
  
  resources :games

  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
           
  resources :playlist_contents
  resources :playlists
  get 'add_song', to: "playlist_contents#add_song_playlist_content"
  get '/member-data', to: 'members#show'
  post '/get_playlist_data', to: 'playlist_contents#get_playlist_data'
  post '/get_user_stats', to: 'games#get_user_stats'
end
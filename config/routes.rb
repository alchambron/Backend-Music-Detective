Rails.application.routes.draw do
  resources :playlist_contents
  resources :playlists
  get 'add_song', to: "playlist_contents#add_song_playlist_content"
end

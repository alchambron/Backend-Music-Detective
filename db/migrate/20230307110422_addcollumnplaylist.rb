class Addcollumnplaylist < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :playlist_url, :string
    change_column :playlists, :genre, :string
  end
end

class Modifyplaylistinfos < ActiveRecord::Migration[7.0]
  def change
    rename_column :playlists, :type, :playlist_type
    remove_column :playlists, :genre, :string
    
  end
end

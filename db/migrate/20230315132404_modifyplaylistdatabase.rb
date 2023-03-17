class Modifyplaylistdatabase < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :title, :string
    add_column :playlists, :thumbnail_url, :string
    add_column :playlists, :type, :string
    remove_column :playlists, :year, :integer
  end
end

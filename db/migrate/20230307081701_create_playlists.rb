class CreatePlaylists < ActiveRecord::Migration[7.0]
  def change
    create_table :playlists do |t|
      t.string :country
      t.integer :year
      t.integer :genre

      t.timestamps
    end
  end
end

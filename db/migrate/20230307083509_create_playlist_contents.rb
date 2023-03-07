class CreatePlaylistContents < ActiveRecord::Migration[7.0]
  def change
    create_table :playlist_contents do |t|
      t.string :youtube_title
      t.string :youtube_id
      t.belongs_to :playlist, foreign_key: true
      t.timestamps
    end
  end
end

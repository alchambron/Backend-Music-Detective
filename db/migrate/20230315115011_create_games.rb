class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :score, default: 100, null: false
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end

class Addcollumntogame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :user, :string
  end
end

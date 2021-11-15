class AddNameArtistAndBioToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :artist, :boolean
    add_column :users, :bio, :text
  end
end

class AddDisplayNameToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :display_name, :string
  end
end

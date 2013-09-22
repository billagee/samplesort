class AddAliasesToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :aliases, :string
  end
end

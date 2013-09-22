class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :name
      t.references :artist
      t.references :release

      t.timestamps
    end
    add_index :recordings, :artist_id
    add_index :recordings, :release_id
  end
end

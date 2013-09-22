class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :transcript
      t.references :sample_source
      t.references :recording

      t.timestamps
    end
    add_index :samples, :sample_source_id
    add_index :samples, :recording_id
  end
end

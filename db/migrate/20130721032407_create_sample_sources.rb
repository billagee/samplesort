class CreateSampleSources < ActiveRecord::Migration
  def change
    create_table :sample_sources do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

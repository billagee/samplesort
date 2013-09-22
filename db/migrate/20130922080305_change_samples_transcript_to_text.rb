class ChangeSamplesTranscriptToText < ActiveRecord::Migration
  def up
    change_column :samples, :transcript, :text
  end

  def down
    change_column :samples, :transcript, :string
  end
end

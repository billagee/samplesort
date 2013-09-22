class Artist < ActiveRecord::Base
  attr_accessible :name, :display_name
  has_many :recordings
  #has_many :samples, through: :recordings
end


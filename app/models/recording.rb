class Recording < ActiveRecord::Base
  belongs_to :artist
  belongs_to :release
  attr_accessible :name, :release, :artist
end

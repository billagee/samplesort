class SampleSource < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :samples
end

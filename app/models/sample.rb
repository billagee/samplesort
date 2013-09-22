class Sample < ActiveRecord::Base
  belongs_to :sample_source
  belongs_to :recording
  attr_accessible :transcript, :sample_source, :recording
end

class Subject < ActiveRecord::Base
  attr_accessible :id, :title

  has_and_belongs_to_many :notes
end

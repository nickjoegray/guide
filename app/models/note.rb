class Note < ActiveRecord::Base
  attr_accessible :id, :title, :content, :example, :word_count

  has_and_belongs_to_many :subjects
end
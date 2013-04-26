class Note < ActiveRecord::Base
  attr_accessible :id, :title, :content, :word_count

  has_and_belongs_to_many :subjects
end
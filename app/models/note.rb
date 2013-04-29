class Note < ActiveRecord::Base
  attr_accessible :id, :title, :content, :word_count

  has_and_belongs_to_many :subjects

  searchable do 
    text :title
    text :content, :default_boost => 2
  end
end
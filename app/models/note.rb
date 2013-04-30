class Note < ActiveRecord::Base
  attr_accessible :id, :title, :content, :word_count

  has_and_belongs_to_many :subjects

  searchable :auto_index => false do 
    text :title
    text :content, :default_boost => 2
  end
end
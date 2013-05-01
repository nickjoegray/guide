class Note < ActiveRecord::Base
  attr_accessible :id, :title, :content, :word_count, :searchable

  has_and_belongs_to_many :subjects

  searchable :auto_index => true do 
    text :title
    text :searchable, :default_boost => 2
  end
end
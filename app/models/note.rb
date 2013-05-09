class Note < ActiveRecord::Base
  attr_accessible :id, :title, :content, :word_count, :searchable

  validates :title, :presence => {:message => "should not be blank"}, :on => :create
  validates :searchable, :presence => {:message => "should not be blank"}

  has_and_belongs_to_many :subjects

  searchable :auto_index => true do 
    text :title
    text :searchable, :default_boost => 2
  end
end
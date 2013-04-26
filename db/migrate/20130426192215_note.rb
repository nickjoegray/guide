class Note < ActiveRecord::Migration
  def up
    create_table :notes, :id => true do |t|
      t.string :title
      t.text :content
      t.integer :word_count
    end
  end

  def down
  end
end

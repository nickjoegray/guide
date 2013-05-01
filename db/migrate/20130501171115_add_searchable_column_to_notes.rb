class AddSearchableColumnToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :searchable, :text
  end
end

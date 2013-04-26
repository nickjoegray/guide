class NoteSubject < ActiveRecord::Migration

  def up
    create_table :notes_subjects, :id => false do |t|
      t.integer :note_id
      t.integer :subject_id
    end
  end

  def down
  end
end

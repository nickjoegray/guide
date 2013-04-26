class Subject < ActiveRecord::Migration
  def up
    create_table :subjects, :id => true do |t|
      t.string :title
    end
  end

  def down
  end
end

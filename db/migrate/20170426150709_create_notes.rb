class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :note
      t.string :author
      t.string :category
      t.datetime :timestamp
      t.boolean :hide_sticky
      t.integer :notable_id
      t.string :notable_type
      t.timestamps
    end
    add_index :notes,[:notable_type,:notable_id]
  end
end

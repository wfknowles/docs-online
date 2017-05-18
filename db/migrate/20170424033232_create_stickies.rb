class CreateStickies < ActiveRecord::Migration[5.0]
  def change
    create_table :stickies do |t|
      t.text :note
      t.string :author
      t.string :category
      t.datetime :timestamp
      t.boolean :hide_sticky

      t.timestamps
    end
  end
end

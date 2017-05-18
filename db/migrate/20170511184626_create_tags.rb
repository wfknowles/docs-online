class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.uuid :uuid,      default: "uuid_generate_v4()",null: false
      t.string :tag_name
      t.string :tag_id
      t.integer :tagable_id
      t.string :tagable_type
      t.timestamps
    end
    add_index :tags,[:tagable_type,:tagable_id]
  end
end

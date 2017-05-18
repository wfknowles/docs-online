class CreateDocuments < ActiveRecord::Migration[5.0]
  def self.up
    create_table :documents do |t|
      t.string :name
      t.string :creator
      t.text :typed

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end

class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :creator
      t.string :typed
      t.string :module
      t.text  :representation
      t.text :filter_field
      t.text :operator
      t.text :first_val
      t.text :second_val
      t.timestamps
    end
  end
end

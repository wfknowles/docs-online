class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :action
      t.string :report
      t.string :display
      t.string :document
      t.string :category

      t.timestamps
    end
  end
end

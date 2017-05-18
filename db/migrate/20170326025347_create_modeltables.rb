class CreateModeltables < ActiveRecord::Migration[5.0]
  def self.up
    create_table :modeltables do |t|
      t.string :name

      t.timestamps
    end
    Modeltable.create :name=>"Shift"
    Modeltable.create :name=>"Provider"
    Modeltable.create :name=>"Site"
  end

  def self.down
    drop_table :modeltables
  end
end

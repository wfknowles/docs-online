class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.integer :provider_id
      t.integer :site_id
      t.string :title
      t.datetime :start
      t.datetime :end
      t.text :status     , limit: 65535
      t.boolean :hide_from_schedule ,default:false
      t.float :custom_pay_rate
      t.float :custom_bill_rate
      t.string :area    ,limit:32
      t.string :filled_on  ,limit:32
      t.string :color

      t.timestamps
    end
  end
end

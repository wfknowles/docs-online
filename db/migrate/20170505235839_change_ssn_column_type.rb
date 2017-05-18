class ChangeSsnColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :providers, :ssn, :string
  end
end

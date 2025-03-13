class ChangeLocationColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :spaces, :location, :address
  end
end

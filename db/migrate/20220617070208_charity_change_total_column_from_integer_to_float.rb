class CharityChangeTotalColumnFromIntegerToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :charities, :total, :float
  end
end

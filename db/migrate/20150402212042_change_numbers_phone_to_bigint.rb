class ChangeNumbersPhoneToBigint < ActiveRecord::Migration
  def change
    change_column :numbers, :phone, :bigint
  end
end

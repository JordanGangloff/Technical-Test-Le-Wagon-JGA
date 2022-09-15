class AddPriceToMissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :price, :integer
  end
end

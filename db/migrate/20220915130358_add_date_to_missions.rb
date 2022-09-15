class AddDateToMissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :date, :string
  end
end

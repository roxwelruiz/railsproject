class AddSportToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sport, :string
  end
end

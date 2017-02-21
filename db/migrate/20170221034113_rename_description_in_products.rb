class RenameDescriptionInProducts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :description, :detailed_description
  end
end

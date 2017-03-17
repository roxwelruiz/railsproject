class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :rating
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

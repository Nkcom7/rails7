class CreateCostDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :cost_details do |t|
      t.string :name
      t.integer :price
      t.text :remark
      t.references :cost, null: false, foreign_key: true

      t.timestamps
    end
  end
end

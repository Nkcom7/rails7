class CreateCostsManagements < ActiveRecord::Migration[7.0]
  def change
    create_table :costs_managements do |t|

      t.timestamps
    end
  end
end

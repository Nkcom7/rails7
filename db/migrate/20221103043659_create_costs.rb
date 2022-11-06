class CreateCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :costs do |t|
      t.date :date
      t.references :costs_management, foreign_key: true
      
      t.timestamps
    end
  end
end

class AddCostFileToCostsManagement < ActiveRecord::Migration[7.0]
  def change
    add_column :costs_managements, :cost_file, :string
  end
end

class CreateEmployeeValues < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_values do |t|
      t.string :NormalizedValue
      t.string :NormalizationValue
      t.string :TotalValue
      t.string :PreferenceValue

      t.timestamps
    end
  end
end

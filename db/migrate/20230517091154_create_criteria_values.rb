class CreateCriteriaValues < ActiveRecord::Migration[7.0]
  def change
    create_table :criteria_values do |t|

      t.timestamps
    end
  end
end

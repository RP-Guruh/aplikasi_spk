class CreateTotalValues < ActiveRecord::Migration[7.0]
  def change
    create_table :total_values do |t|

      t.timestamps
    end
  end
end

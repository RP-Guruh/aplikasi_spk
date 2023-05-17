class CreatePreferenceValues < ActiveRecord::Migration[7.0]
  def change
    create_table :preference_values do |t|

      t.timestamps
    end
  end
end

class AddColumnPreferenceValue < ActiveRecord::Migration[7.0]
  def change
    add_column :preference_values, :kriteria, :string, null: false
    add_column :preference_values, :keterangan, :string, null: false
    add_column :preference_values, :bobot_nilai, :decimal
  end
end

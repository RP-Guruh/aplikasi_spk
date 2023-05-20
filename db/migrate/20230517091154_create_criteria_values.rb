class CreateCriteriaValues < ActiveRecord::Migration[7.0]
  def change
    create_table :criteria_values do |t|
      add_column :criteria_values, :kriteria, :string
      add_column :criteria_values, :keterangan, :string
      add_column :criteria_values, :bobot_nilai, :decimal
      t.timestamps
    end

  end
end

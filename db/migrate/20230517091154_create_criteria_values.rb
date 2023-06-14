class CreateCriteriaValues < ActiveRecord::Migration[7.0]
  def change
    create_table :criteria_values do |t|
      t.string :kriteria
      t.string :keterangan
      t.integer :bobot_nilai
      t.timestamps
    end

  end
end

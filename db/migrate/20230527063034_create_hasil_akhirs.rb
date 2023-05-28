class CreateHasilAkhirs < ActiveRecord::Migration[7.0]
  def change
    create_table :hasil_akhirs do |t|
      t.integer :id_employee
      t.float   :nilai_akhir
      t.string  :status, default: "completed"
      t.integer :ranking
      t.timestamps
    end
  end
end

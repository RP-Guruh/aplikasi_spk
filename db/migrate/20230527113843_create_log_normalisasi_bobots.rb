class CreateLogNormalisasiBobots < ActiveRecord::Migration[7.0]
  def change
    create_table :log_normalisasi_bobots do |t|
      t.integer :id_employee
      t.integer :id_kriteria
      t.float   :nilai_bobot
      t.string  :status, default: "request"
      t.timestamps
    end
  end
end

class CreateNormalisasis < ActiveRecord::Migration[7.0]
  def change
    create_table :normalisasis do |t|
      t.integer :id_employee
      t.integer :id_kriteria
      t.float :nilai_normalisasi
      t.string  :status, default: "request"
      t.timestamps
    end
  end
end

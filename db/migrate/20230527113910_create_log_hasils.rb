class CreateLogHasils < ActiveRecord::Migration[7.0]
  def change
    create_table :log_hasils do |t|

      t.integer :id_employee
      t.float   :nilai_akhir
      t.string  :status, default: "completed"
      t.timestamps
    end
  end
end

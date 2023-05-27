class CreateLogDataSources < ActiveRecord::Migration[7.0]
  def change
    create_table :log_data_sources do |t|

      t.integer :id_employee
      t.integer :id_kriteria
      t.integer :nilai
      t.string  :status, default: "request"
      t.timestamps
    end
  end
end

class CreateKaryawans < ActiveRecord::Migration[7.0]
  def change
    create_table :karyawans do |t|

      t.timestamps
    end
  end
end

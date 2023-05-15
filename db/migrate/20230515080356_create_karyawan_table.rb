class CreateKaryawanTable < ActiveRecord::Migration[7.0]
  def change
    create_table :karyawan_tables do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :position
      t.string :department
      t.decimal :salary
      t.date :start_date
      t.string :employment_status
      t.timestamps
    end
  end
end

class EmployeesController < ApplicationController
  def index
    # ambil semua data karyawan, dan tampilkan di views index
    @karyawan = Employee.all
  end
end

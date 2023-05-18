class EmployeesController < ApplicationController
  def index
    # ambil semua data karyawan, dan tampilkan di views index
    @karyawan = Employee.all
  end

  def create
    employee = Employee.new
    employee.first_name = params[:first_name]
    employee.last_name = params[:last_name]
    employee.date_of_birth = params[:dob]
    employee.gender = params[:gender]
    employee.address = params[:address]
    employee.position = params[:position]
    employee.department = params[:department]
    employee.phone_number = params[:phone_num]
    employee.email = params[:email]
    employee.employment_status = params[:status]
    
    if employee.save
      flash[:success] = "Employee saved successfully."
      @save_time = Time.now
      redirect_to employee_path(employee)
    else
      flash[:danger] = "Failed to save employee."
      @save_time = Time.now
      redirect_to employee_path(employee)
    end
  end

  def destroy
    employee = Employee.find(params[:deleteID])
    if employee.destroy
      flash[:success] = "Employee deleted successfully."
      @save_time = Time.now
      redirect_to employee_path(employee)
    else
      flash[:danger] = "Failed to delete employee."
      @save_time = Time.now
      redirect_to employee_path(employee)
    end
  end
end

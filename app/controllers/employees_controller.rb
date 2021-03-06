class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
      if @employee.save
        redirect_to @employee, notice: 'Employee was successfully created.'
      else
       render :new  
      end
    end

  def update
      if @employee.update(employee_params)
        redirect_to @employee, notice: 'Employee was successfully updated.' 
      else
        render :edit
      end
  end

  def destroy
    if @employee.destroy
       redirect_to employees_path, notice: 'Employee was successfully destroyed.' 
    else
       redirect_to @employee, alert: "Error: #{ @employee.errors.full_messages.join(', ')}"
    end
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:eid, :name, :gender, :joining_date, :phone_number)
    end
end

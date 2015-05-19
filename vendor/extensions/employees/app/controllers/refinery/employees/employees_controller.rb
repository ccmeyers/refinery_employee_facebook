module Refinery
  module Employees
    class EmployeesController < ::ApplicationController

      before_filter :find_all_employees, :find_all_departments
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employee in the line below:
        present(@page)
      end

      def show
        @employee = Employee.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employee in the line below:
        present(@page)
      end

    protected

      def find_all_employees
        @employees = Employee.order('position ASC')
      end

      def find_all_departments
        @departments = Refinery::Employees::Department.all
      end

      def find_all_skills
        @skills = Refinery::Employees::Department.all
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/employees").first
      end

    end
  end
end
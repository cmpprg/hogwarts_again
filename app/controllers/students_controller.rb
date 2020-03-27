class StudentsController < ApplicationController
  def index
    @students = Student.all.order(:name)
  end
end

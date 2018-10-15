require 'pry'
class StudentsController < ApplicationController
  def new
    @student = Student.new
  end


  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    # binding.pry
    @student = Student.new(params.require(:student))
    @student.save
    redirect_to student_path(@student)
  end

  def update
    @student = Student.find(params[:id])
    @student.update(params.require(:student))
    redirect_to student_path(@student)
  end

  private


  # We pass the permitted fields in as *args;
  # this keeps `post_params` pretty dry while
  # still allowing slightly different behavior
  # depending on the controller action
  def post_params(*args)
    params.require(:post).permit(*args)
  end

end

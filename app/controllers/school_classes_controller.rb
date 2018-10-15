require 'pry'

class SchoolClassesController < ApplicationController
  def new
      @school_class = SchoolClass.new
  end

  def show
    @class = SchoolClass.find(params[:id])
  end

  def edit
    @school_class = SchoolClass.find(params[:id])
  end

  def create
    @class = SchoolClass.new(params.require(:school_class))
    @class.save
    redirect_to school_class_path(@class)
  end

  def update
    # binding.pry
    @school_class = SchoolClass.find(params[:id])
    @school_class.update(params.require(:school_class))
    redirect_to school_class_path(@school_class)
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

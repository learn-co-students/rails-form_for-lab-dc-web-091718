class SchoolClassesController < ApplicationController

  before_action :find_class, only: [:edit, :show, :update, :destroy]

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.create(school_class_params)
    redirect_to school_class_path(@school_class)
  end

  def show
  end

  def edit
  end

  def update
    @school_class.update(school_class_params)
    redirect_to school_class_path(@school_class)
  end

  private

  def school_class_params
    params.require(:school_class).permit(:title, :room_number)
  end

  def find_class
    @school_class = SchoolClass.find(params[:id])
  end
end

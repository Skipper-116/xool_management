class Api::V1::ClassroomTeachersController < ApplicationController
  before_action :set_classroom_teacher, only: [:show, :update, :destroy]

  # GET /classroom_teachers
  def index
    @classroom_teachers = ClassroomTeacher.all

    render json: @classroom_teachers
  end

  # GET /classroom_teachers/1
  def show
    render json: @classroom_teacher
  end

  # POST /classroom_teachers
  def create
    @classroom_teacher = ClassroomTeacher.new(classroom_teacher_params)

    if @classroom_teacher.save
      render json: @classroom_teacher, status: :created, location: @classroom_teacher
    else
      render json: @classroom_teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classroom_teachers/1
  def update
    if @classroom_teacher.update(classroom_teacher_params)
      render json: @classroom_teacher
    else
      render json: @classroom_teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classroom_teachers/1
  def destroy
    @classroom_teacher.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom_teacher
      @classroom_teacher = ClassroomTeacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_teacher_params
      params.require(:classroom_teacher).permit(:classroom_id, :cohort_term_id, :person_id)
    end
end

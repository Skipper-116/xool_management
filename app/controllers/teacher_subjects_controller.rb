class TeacherSubjectsController < ApplicationController
  before_action :set_teacher_subject, only: [:show, :update, :destroy]

  # GET /teacher_subjects
  def index
    @teacher_subjects = TeacherSubject.all

    render json: @teacher_subjects
  end

  # GET /teacher_subjects/1
  def show
    render json: @teacher_subject
  end

  # POST /teacher_subjects
  def create
    @teacher_subject = TeacherSubject.new(teacher_subject_params)

    if @teacher_subject.save
      render json: @teacher_subject, status: :created, location: @teacher_subject
    else
      render json: @teacher_subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teacher_subjects/1
  def update
    if @teacher_subject.update(teacher_subject_params)
      render json: @teacher_subject
    else
      render json: @teacher_subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teacher_subjects/1
  def destroy
    @teacher_subject.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_subject
      @teacher_subject = TeacherSubject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teacher_subject_params
      params.require(:teacher_subject).permit(:person_id, :subject_id)
    end
end

# frozen_string_literal: true

module Api
  module V1
    class ClassroomStudentsController < ApplicationController
      before_action :set_classroom_student, only: %i[show update destroy]

      # GET /classroom_students
      def index
        @classroom_students = ClassroomStudent.all

        render json: @classroom_students
      end

      # GET /classroom_students/1
      def show
        render json: @classroom_student
      end

      # POST /classroom_students
      def create
        @classroom_student = ClassroomStudent.create!(classroom_student_params)

        if @classroom_student.errors.empty?
          render json: @classroom_student, status: :created
        else
          render json: @classroom_student.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /classroom_students/1
      def update
        if @classroom_student.update(classroom_student_params)
          render json: @classroom_student
        else
          render json: @classroom_student.errors, status: :unprocessable_entity
        end
      end

      # DELETE /classroom_students/1
      def destroy
        @classroom_student.void('Removed from classroom')
        render json: { message: 'ClassroomStudent was successfully removed.' }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_classroom_student
        @classroom_student = ClassroomStudent.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def classroom_student_params
        params.require(:classroom_student).permit(:classroom_id, :cohort_term_id, :person_id)
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class ClassroomsController < ApplicationController
      before_action :set_classroom, only: %i[show update destroy]

      # GET /classrooms
      def index
        @classrooms = Classroom.all

        render json: @classrooms
      end

      # GET /classrooms/1
      def show
        render json: @classroom
      end

      # POST /classrooms
      def create
        @classroom = Classroom.new(classroom_params)

        if @classroom.save
          render json: @classroom, status: :created
        else
          render json: @classroom.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /classrooms/1
      def update
        if @classroom.update(classroom_params)
          render json: @classroom
        else
          render json: @classroom.errors, status: :unprocessable_entity
        end
      end

      # DELETE /classrooms/1
      def destroy
        @classroom.void(params.require(:void_reason))
        render json: { message: 'Classroom was successfully voided.' }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_classroom
        @classroom = Classroom.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def classroom_params
        params.require(:classroom).permit(:name, :description, :space)
      end
    end
  end
end

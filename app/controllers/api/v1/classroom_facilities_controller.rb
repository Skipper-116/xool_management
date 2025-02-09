# frozen_string_literal: true

module Api
  module V1
    class ClassroomFacilitiesController < ApplicationController
      before_action :set_classroom_facility, only: %i[show update destroy]

      # GET /classroom_facilities
      def index
        @classroom_facilities = ClassroomFacility.all

        render json: @classroom_facilities
      end

      # GET /classroom_facilities/1
      def show
        render json: @classroom_facility
      end

      # POST /classroom_facilities
      def create
        @classroom_facility = ClassroomFacility.new(classroom_facility_params)

        if @classroom_facility.save
          render json: @classroom_facility, status: :created
        else
          render json: @classroom_facility.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /classroom_facilities/1
      def update
        if @classroom_facility.update(classroom_facility_params)
          render json: @classroom_facility
        else
          render json: @classroom_facility.errors, status: :unprocessable_entity
        end
      end

      # DELETE /classroom_facilities/1
      def destroy
        @classroom_facility.void('Removed by User')
        render json: { message: 'Classroom Facility removed successfully' }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_classroom_facility
        @classroom_facility = ClassroomFacility.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def classroom_facility_params
        params.require(:classroom_facility).permit(:name, :description, :quantity, :classroom_id)
      end
    end
  end
end

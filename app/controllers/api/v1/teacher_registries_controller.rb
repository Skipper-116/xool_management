# frozen_string_literal: true

module Api
  module V1
    class TeacherRegistriesController < ApplicationController
      before_action :set_teacher_registry, only: %i[show update destroy]

      # GET /teacher_registries
      def index
        @teacher_registries = TeacherRegistry.all

        render json: @teacher_registries
      end

      # GET /teacher_registries/1
      def show
        render json: @teacher_registry
      end

      # POST /teacher_registries
      def create
        @teacher_registry = TeacherRegistry.new(teacher_registry_params)

        if @teacher_registry.save
          render json: @teacher_registry, status: :created, location: @teacher_registry
        else
          render json: @teacher_registry.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /teacher_registries/1
      def update
        if @teacher_registry.update(teacher_registry_params)
          render json: @teacher_registry
        else
          render json: @teacher_registry.errors, status: :unprocessable_entity
        end
      end

      # DELETE /teacher_registries/1
      def destroy
        @teacher_registry.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_teacher_registry
        @teacher_registry = TeacherRegistry.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def teacher_registry_params
        params.require(:teacher_registry).permit(:cohort_id, :person_id, :captured_by, :present, :absent_reason)
      end
    end
  end
end

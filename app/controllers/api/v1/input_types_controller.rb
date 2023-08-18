# frozen_string_literal: true

module Api
  module V1
    class InputTypesController < ApplicationController
      before_action :set_input_type, only: %i[show update destroy]

      # GET /input_types
      def index
        @input_types = InputType.all

        render json: @input_types
      end

      # GET /input_types/1
      def show
        render json: @input_type
      end

      # POST /input_types
      def create
        @input_type = InputType.new(input_type_params)

        if @input_type.save
          render json: @input_type, status: :created, location: @input_type
        else
          render json: @input_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /input_types/1
      def update
        if @input_type.update(input_type_params)
          render json: @input_type
        else
          render json: @input_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /input_types/1
      def destroy
        @input_type.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_input_type
        @input_type = InputType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def input_type_params
        params.require(:input_type).permit(:name, :pattern, :voided, :void_reason, :voided_at)
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class RelationshipTypesController < ApplicationController
      before_action :set_relationship_type, only: %i[show update destroy]

      # GET /relationship_types
      def index
        @relationship_types = RelationshipType.all

        render json: @relationship_types
      end

      # GET /relationship_types/1
      def show
        render json: @relationship_type
      end

      # POST /relationship_types
      def create
        @relationship_type = RelationshipType.new(relationship_type_params)

        if @relationship_type.save
          render json: @relationship_type, status: :created, location: @relationship_type
        else
          render json: @relationship_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /relationship_types/1
      def update
        if @relationship_type.update(relationship_type_params)
          render json: @relationship_type
        else
          render json: @relationship_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /relationship_types/1
      def destroy
        @relationship_type.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_relationship_type
        @relationship_type = RelationshipType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def relationship_type_params
        params.require(:relationship_type).permit(:a_is_to_b, :b_is_to_a, :description)
      end
    end
  end
end

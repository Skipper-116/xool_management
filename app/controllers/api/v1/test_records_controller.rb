# frozen_string_literal: true

module Api
  module V1
    class TestRecordsController < ApplicationController
      before_action :set_test_record, only: %i[show update destroy]

      # GET /test_records
      def index
        @test_records = TestRecord.all

        render json: @test_records
      end

      # GET /test_records/1
      def show
        render json: @test_record
      end

      # POST /test_records
      def create
        @test_record = TestRecord.new(test_record_params)

        if @test_record.save
          render json: @test_record, status: :created, location: @test_record
        else
          render json: @test_record.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /test_records/1
      def update
        if @test_record.update(test_record_params)
          render json: @test_record
        else
          render json: @test_record.errors, status: :unprocessable_entity
        end
      end

      # DELETE /test_records/1
      def destroy
        @test_record.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_test_record
        @test_record = TestRecord.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def test_record_params
        params.require(:test_record).permit(:classroom_id, :cohort_term_id, :subject_id, :person_id, :title, :content,
                                            :other_resources, :start_date, :end_date, :results_available)
      end
    end
  end
end

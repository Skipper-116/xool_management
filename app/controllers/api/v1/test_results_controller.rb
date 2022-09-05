class Api::V1::TestResultsController < ApplicationController
  before_action :set_test_result, only: [:show, :update, :destroy]

  # GET /test_results
  def index
    @test_results = TestResult.all

    render json: @test_results
  end

  # GET /test_results/1
  def show
    render json: @test_result
  end

  # POST /test_results
  def create
    @test_result = TestResult.new(test_result_params)

    if @test_result.save
      render json: @test_result, status: :created, location: @test_result
    else
      render json: @test_result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /test_results/1
  def update
    if @test_result.update(test_result_params)
      render json: @test_result
    else
      render json: @test_result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /test_results/1
  def destroy
    @test_result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_result
      @test_result = TestResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_result_params
      params.require(:test_result).permit(:TestRecord_id, :person_id, :grade)
    end
end

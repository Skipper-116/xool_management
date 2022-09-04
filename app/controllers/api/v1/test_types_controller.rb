class Api::V1::TestTypesController < ApplicationController
  before_action :set_test_type, only: [:show, :update, :destroy]

  # GET /test_types
  def index
    @test_types = TestType.all

    render json: @test_types
  end

  # GET /test_types/1
  def show
    render json: @test_type
  end

  # POST /test_types
  def create
    @test_type = TestType.new(test_type_params)

    if @test_type.save
      render json: @test_type, status: :created, location: @test_type
    else
      render json: @test_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /test_types/1
  def update
    if @test_type.update(test_type_params)
      render json: @test_type
    else
      render json: @test_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /test_types/1
  def destroy
    @test_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_type
      @test_type = TestType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_type_params
      params.require(:test_type).permit(:name, :description, :scale)
    end
end

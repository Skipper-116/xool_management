class StudentRegistriesController < ApplicationController
  before_action :set_student_registry, only: [:show, :update, :destroy]

  # GET /student_registries
  def index
    @student_registries = StudentRegistry.all

    render json: @student_registries
  end

  # GET /student_registries/1
  def show
    render json: @student_registry
  end

  # POST /student_registries
  def create
    @student_registry = StudentRegistry.new(student_registry_params)

    if @student_registry.save
      render json: @student_registry, status: :created, location: @student_registry
    else
      render json: @student_registry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /student_registries/1
  def update
    if @student_registry.update(student_registry_params)
      render json: @student_registry
    else
      render json: @student_registry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /student_registries/1
  def destroy
    @student_registry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_registry
      @student_registry = StudentRegistry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_registry_params
      params.require(:student_registry).permit(:classroom_id, :cohort_term_id, :person_id, :captured_by, :present, :absent_reason)
    end
end

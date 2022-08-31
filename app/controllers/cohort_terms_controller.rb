class CohortTermsController < ApplicationController
  before_action :set_cohort_term, only: [:show, :update, :destroy]

  # GET /cohort_terms
  def index
    @cohort_terms = CohortTerm.all

    render json: @cohort_terms
  end

  # GET /cohort_terms/1
  def show
    render json: @cohort_term
  end

  # POST /cohort_terms
  def create
    @cohort_term = CohortTerm.new(cohort_term_params)

    if @cohort_term.save
      render json: @cohort_term, status: :created, location: @cohort_term
    else
      render json: @cohort_term.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cohort_terms/1
  def update
    if @cohort_term.update(cohort_term_params)
      render json: @cohort_term
    else
      render json: @cohort_term.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cohort_terms/1
  def destroy
    @cohort_term.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cohort_term
      @cohort_term = CohortTerm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cohort_term_params
      params.require(:cohort_term).permit(:name, :start_date, :end_date, :cohort_id)
    end
end

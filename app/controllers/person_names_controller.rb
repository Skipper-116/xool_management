class PersonNamesController < ApplicationController
  before_action :set_person_name, only: [:show, :update, :destroy]

  # GET /person_names
  def index
    @person_names = PersonName.all

    render json: @person_names
  end

  # GET /person_names/1
  def show
    render json: @person_name
  end

  # POST /person_names
  def create
    @person_name = PersonName.new(person_name_params)

    if @person_name.save
      render json: @person_name, status: :created, location: @person_name
    else
      render json: @person_name.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /person_names/1
  def update
    if @person_name.update(person_name_params)
      render json: @person_name
    else
      render json: @person_name.errors, status: :unprocessable_entity
    end
  end

  # DELETE /person_names/1
  def destroy
    @person_name.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_name
      @person_name = PersonName.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_name_params
      params.require(:person_name).permit(:given_name, :family_name, :maiden_name, :middle_name, :person_id)
    end
end

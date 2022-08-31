class PersonAttributeTypesController < ApplicationController
  before_action :set_person_attribute_type, only: [:show, :update, :destroy]

  # GET /person_attribute_types
  def index
    @person_attribute_types = PersonAttributeType.all

    render json: @person_attribute_types
  end

  # GET /person_attribute_types/1
  def show
    render json: @person_attribute_type
  end

  # POST /person_attribute_types
  def create
    @person_attribute_type = PersonAttributeType.new(person_attribute_type_params)

    if @person_attribute_type.save
      render json: @person_attribute_type, status: :created, location: @person_attribute_type
    else
      render json: @person_attribute_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /person_attribute_types/1
  def update
    if @person_attribute_type.update(person_attribute_type_params)
      render json: @person_attribute_type
    else
      render json: @person_attribute_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /person_attribute_types/1
  def destroy
    @person_attribute_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_attribute_type
      @person_attribute_type = PersonAttributeType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_attribute_type_params
      params.require(:person_attribute_type).permit(:name, :description)
    end
end

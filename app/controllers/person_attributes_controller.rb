class PersonAttributesController < ApplicationController
  before_action :set_person_attribute, only: [:show, :update, :destroy]

  # GET /person_attributes
  def index
    @person_attributes = PersonAttribute.all

    render json: @person_attributes
  end

  # GET /person_attributes/1
  def show
    render json: @person_attribute
  end

  # POST /person_attributes
  def create
    @person_attribute = PersonAttribute.new(person_attribute_params)

    if @person_attribute.save
      render json: @person_attribute, status: :created, location: @person_attribute
    else
      render json: @person_attribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /person_attributes/1
  def update
    if @person_attribute.update(person_attribute_params)
      render json: @person_attribute
    else
      render json: @person_attribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /person_attributes/1
  def destroy
    @person_attribute.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_attribute
      @person_attribute = PersonAttribute.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_attribute_params
      params.require(:person_attribute).permit(:person_id, :person_attribute_type_id, :attribute_value)
    end
end

class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: %i[show update destroy]

  # GET /people
  def index
    @people = Person.all

    render json: @people
  end

  # GET /people/1
  def show
    render json: @person, status: @person ? :ok : :not_found
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      render json: @person, status: :created
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    @person&.void('Removed from System')
    @person ? render(json: { message: 'Removed successfully' }, status: :ok) : render(json: @person, status: :not_found)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.where(id: params[:id])&.first
  end

  # Only allow a trusted parameter "white list" through.
  def person_params
    params.require(:person).permit(:birthdate, :gender_id, :bithdate_estimated)
  end
end

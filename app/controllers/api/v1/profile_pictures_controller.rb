# frozen_string_literal: true

module Api
  module V1
    class ProfilePicturesController < ApplicationController
      before_action :set_profile_picture, only: %i[show update destroy]

      # GET /profile_pictures
      def index
        @profile_pictures = ProfilePicture.all

        render json: @profile_pictures
      end

      # GET /profile_pictures/1
      def show
        render json: @profile_picture
      end

      # POST /profile_pictures
      def create
        @profile_picture = ProfilePicture.new(profile_picture_params)

        if @profile_picture.save
          render json: @profile_picture, status: :created, location: @profile_picture
        else
          render json: @profile_picture.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /profile_pictures/1
      def update
        if @profile_picture.update(profile_picture_params)
          render json: @profile_picture
        else
          render json: @profile_picture.errors, status: :unprocessable_entity
        end
      end

      # DELETE /profile_pictures/1
      def destroy
        @profile_picture.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_profile_picture
        @profile_picture = ProfilePicture.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def profile_picture_params
        params.require(:profile_picture).permit(:image_url, :person_id)
      end
    end
  end
end

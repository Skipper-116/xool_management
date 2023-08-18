# frozen_string_literal: true

require 'test_helper'

class ProfilePicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile_picture = profile_pictures(:one)
  end

  test 'should get index' do
    get profile_pictures_url, as: :json
    assert_response :success
  end

  test 'should create profile_picture' do
    assert_difference('ProfilePicture.count') do
      post profile_pictures_url,
           params: { profile_picture: { image_url: @profile_picture.image_url, person_id: @profile_picture.person_id } }, as: :json
    end

    assert_response 201
  end

  test 'should show profile_picture' do
    get profile_picture_url(@profile_picture), as: :json
    assert_response :success
  end

  test 'should update profile_picture' do
    patch profile_picture_url(@profile_picture),
          params: { profile_picture: { image_url: @profile_picture.image_url, person_id: @profile_picture.person_id } }, as: :json
    assert_response 200
  end

  test 'should destroy profile_picture' do
    assert_difference('ProfilePicture.count', -1) do
      delete profile_picture_url(@profile_picture), as: :json
    end

    assert_response 204
  end
end

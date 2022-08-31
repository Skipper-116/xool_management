require 'test_helper'

class GendersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gender = genders(:one)
  end

  test "should get index" do
    get genders_url, as: :json
    assert_response :success
  end

  test "should create gender" do
    assert_difference('Gender.count') do
      post genders_url, params: { gender: { description: @gender.description, name: @gender.name } }, as: :json
    end

    assert_response 201
  end

  test "should show gender" do
    get gender_url(@gender), as: :json
    assert_response :success
  end

  test "should update gender" do
    patch gender_url(@gender), params: { gender: { description: @gender.description, name: @gender.name } }, as: :json
    assert_response 200
  end

  test "should destroy gender" do
    assert_difference('Gender.count', -1) do
      delete gender_url(@gender), as: :json
    end

    assert_response 204
  end
end

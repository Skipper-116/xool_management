require 'test_helper'

class ClassroomFacilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classroom_facility = classroom_facilities(:one)
  end

  test "should get index" do
    get classroom_facilities_url, as: :json
    assert_response :success
  end

  test "should create classroom_facility" do
    assert_difference('ClassroomFacility.count') do
      post classroom_facilities_url, params: { classroom_facility: { description: @classroom_facility.description, name: @classroom_facility.name, quantity: @classroom_facility.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show classroom_facility" do
    get classroom_facility_url(@classroom_facility), as: :json
    assert_response :success
  end

  test "should update classroom_facility" do
    patch classroom_facility_url(@classroom_facility), params: { classroom_facility: { description: @classroom_facility.description, name: @classroom_facility.name, quantity: @classroom_facility.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy classroom_facility" do
    assert_difference('ClassroomFacility.count', -1) do
      delete classroom_facility_url(@classroom_facility), as: :json
    end

    assert_response 204
  end
end

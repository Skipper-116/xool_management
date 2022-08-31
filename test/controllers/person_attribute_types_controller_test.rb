require 'test_helper'

class PersonAttributeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_attribute_type = person_attribute_types(:one)
  end

  test "should get index" do
    get person_attribute_types_url, as: :json
    assert_response :success
  end

  test "should create person_attribute_type" do
    assert_difference('PersonAttributeType.count') do
      post person_attribute_types_url, params: { person_attribute_type: { description: @person_attribute_type.description, name: @person_attribute_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show person_attribute_type" do
    get person_attribute_type_url(@person_attribute_type), as: :json
    assert_response :success
  end

  test "should update person_attribute_type" do
    patch person_attribute_type_url(@person_attribute_type), params: { person_attribute_type: { description: @person_attribute_type.description, name: @person_attribute_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy person_attribute_type" do
    assert_difference('PersonAttributeType.count', -1) do
      delete person_attribute_type_url(@person_attribute_type), as: :json
    end

    assert_response 204
  end
end

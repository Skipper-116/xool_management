require 'test_helper'

class PersonAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_attribute = person_attributes(:one)
  end

  test "should get index" do
    get person_attributes_url, as: :json
    assert_response :success
  end

  test "should create person_attribute" do
    assert_difference('PersonAttribute.count') do
      post person_attributes_url, params: { person_attribute: { attribute_value: @person_attribute.attribute_value, person_attribute_type_id: @person_attribute.person_attribute_type_id, person_id: @person_attribute.person_id } }, as: :json
    end

    assert_response 201
  end

  test "should show person_attribute" do
    get person_attribute_url(@person_attribute), as: :json
    assert_response :success
  end

  test "should update person_attribute" do
    patch person_attribute_url(@person_attribute), params: { person_attribute: { attribute_value: @person_attribute.attribute_value, person_attribute_type_id: @person_attribute.person_attribute_type_id, person_id: @person_attribute.person_id } }, as: :json
    assert_response 200
  end

  test "should destroy person_attribute" do
    assert_difference('PersonAttribute.count', -1) do
      delete person_attribute_url(@person_attribute), as: :json
    end

    assert_response 204
  end
end

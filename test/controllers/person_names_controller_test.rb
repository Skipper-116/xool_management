require 'test_helper'

class PersonNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_name = person_names(:one)
  end

  test "should get index" do
    get person_names_url, as: :json
    assert_response :success
  end

  test "should create person_name" do
    assert_difference('PersonName.count') do
      post person_names_url, params: { person_name: { family_name: @person_name.family_name, given_name: @person_name.given_name, maiden_name: @person_name.maiden_name, middle_name: @person_name.middle_name, person_id: @person_name.person_id } }, as: :json
    end

    assert_response 201
  end

  test "should show person_name" do
    get person_name_url(@person_name), as: :json
    assert_response :success
  end

  test "should update person_name" do
    patch person_name_url(@person_name), params: { person_name: { family_name: @person_name.family_name, given_name: @person_name.given_name, maiden_name: @person_name.maiden_name, middle_name: @person_name.middle_name, person_id: @person_name.person_id } }, as: :json
    assert_response 200
  end

  test "should destroy person_name" do
    assert_difference('PersonName.count', -1) do
      delete person_name_url(@person_name), as: :json
    end

    assert_response 204
  end
end

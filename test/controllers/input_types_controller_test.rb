# frozen_string_literal: true

require 'test_helper'

class InputTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @input_type = input_types(:one)
  end

  test 'should get index' do
    get input_types_url, as: :json
    assert_response :success
  end

  test 'should create input_type' do
    assert_difference('InputType.count') do
      post input_types_url,
           params: { input_type: { voided_at: @input_type.voided_at, name: @input_type.name, pattern: @input_type.pattern, void_reason: @input_type.void_reason, voided: @input_type.voided } }, as: :json
    end

    assert_response 201
  end

  test 'should show input_type' do
    get input_type_url(@input_type), as: :json
    assert_response :success
  end

  test 'should update input_type' do
    patch input_type_url(@input_type),
          params: { input_type: { voided_at: @input_type.voided_at, name: @input_type.name, pattern: @input_type.pattern, void_reason: @input_type.void_reason, voided: @input_type.voided } }, as: :json
    assert_response 200
  end

  test 'should destroy input_type' do
    assert_difference('InputType.count', -1) do
      delete input_type_url(@input_type), as: :json
    end

    assert_response 204
  end
end

# frozen_string_literal: true

require 'test_helper'

class TestTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_type = test_types(:one)
  end

  test 'should get index' do
    get test_types_url, as: :json
    assert_response :success
  end

  test 'should create test_type' do
    assert_difference('TestType.count') do
      post test_types_url,
           params: { test_type: { description: @test_type.description, name: @test_type.name, scale: @test_type.scale } }, as: :json
    end

    assert_response 201
  end

  test 'should show test_type' do
    get test_type_url(@test_type), as: :json
    assert_response :success
  end

  test 'should update test_type' do
    patch test_type_url(@test_type),
          params: { test_type: { description: @test_type.description, name: @test_type.name, scale: @test_type.scale } }, as: :json
    assert_response 200
  end

  test 'should destroy test_type' do
    assert_difference('TestType.count', -1) do
      delete test_type_url(@test_type), as: :json
    end

    assert_response 204
  end
end

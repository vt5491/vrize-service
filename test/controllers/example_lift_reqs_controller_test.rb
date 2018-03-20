require 'test_helper'

class ExampleLiftReqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @example_lift_req = example_lift_reqs(:one)
  end

  test "should get index" do
    get example_lift_reqs_url
    assert_response :success
  end

  test "should get new" do
    get new_example_lift_req_url
    assert_response :success
  end

  test "should create example_lift_req" do
    assert_difference('ExampleLiftReq.count') do
      post example_lift_reqs_url, params: { example_lift_req: { examples_id: @example_lift_req.examples_id } }
    end

    assert_redirected_to example_lift_req_url(ExampleLiftReq.last)
  end

  test "should show example_lift_req" do
    get example_lift_req_url(@example_lift_req)
    assert_response :success
  end

  test "should get edit" do
    get edit_example_lift_req_url(@example_lift_req)
    assert_response :success
  end

  test "should update example_lift_req" do
    patch example_lift_req_url(@example_lift_req), params: { example_lift_req: { examples_id: @example_lift_req.examples_id } }
    assert_redirected_to example_lift_req_url(@example_lift_req)
  end

  test "should destroy example_lift_req" do
    assert_difference('ExampleLiftReq.count', -1) do
      delete example_lift_req_url(@example_lift_req)
    end

    assert_redirected_to example_lift_reqs_url
  end
end

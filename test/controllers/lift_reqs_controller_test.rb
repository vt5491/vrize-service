require 'test_helper'

class LiftReqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lift_req = lift_reqs(:one)
  end

  test "should get index" do
    get lift_reqs_url
    assert_response :success
  end

  test "should get new" do
    get new_lift_req_url
    assert_response :success
  end

  test "should create lift_req" do
    assert_difference('LiftReq.count') do
      post lift_reqs_url, params: { lift_req: { example_id: @lift_req.example_id } }
    end

    assert_redirected_to lift_req_url(LiftReq.last)
  end

  test "should show lift_req" do
    get lift_req_url(@lift_req)
    assert_response :success
  end

  test "should get edit" do
    get edit_lift_req_url(@lift_req)
    assert_response :success
  end

  test "should update lift_req" do
    patch lift_req_url(@lift_req), params: { lift_req: { example_id: @lift_req.example_id } }
    assert_redirected_to lift_req_url(@lift_req)
  end

  test "should destroy lift_req" do
    assert_difference('LiftReq.count', -1) do
      delete lift_req_url(@lift_req)
    end

    assert_redirected_to lift_reqs_url
  end
end

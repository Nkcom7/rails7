require "test_helper"

class CostsManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @costs_management = costs_managements(:one)
  end

  test "should get index" do
    get costs_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_costs_management_url
    assert_response :success
  end

  test "should create costs_management" do
    assert_difference("CostsManagement.count") do
      post costs_managements_url, params: { costs_management: {  } }
    end

    assert_redirected_to costs_management_url(CostsManagement.last)
  end

  test "should show costs_management" do
    get costs_management_url(@costs_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_costs_management_url(@costs_management)
    assert_response :success
  end

  test "should update costs_management" do
    patch costs_management_url(@costs_management), params: { costs_management: {  } }
    assert_redirected_to costs_management_url(@costs_management)
  end

  test "should destroy costs_management" do
    assert_difference("CostsManagement.count", -1) do
      delete costs_management_url(@costs_management)
    end

    assert_redirected_to costs_managements_url
  end
end

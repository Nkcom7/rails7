require "application_system_test_case"

class CostsManagementsTest < ApplicationSystemTestCase
  setup do
    @costs_management = costs_managements(:one)
  end

  test "visiting the index" do
    visit costs_managements_url
    assert_selector "h1", text: "Costs managements"
  end

  test "should create costs management" do
    visit costs_managements_url
    click_on "New costs management"

    click_on "Create Costs management"

    assert_text "Costs management was successfully created"
    click_on "Back"
  end

  test "should update Costs management" do
    visit costs_management_url(@costs_management)
    click_on "Edit this costs management", match: :first

    click_on "Update Costs management"

    assert_text "Costs management was successfully updated"
    click_on "Back"
  end

  test "should destroy Costs management" do
    visit costs_management_url(@costs_management)
    click_on "Destroy this costs management", match: :first

    assert_text "Costs management was successfully destroyed"
  end
end

require "application_system_test_case"

class PortionsTest < ApplicationSystemTestCase
  setup do
    @portion = portions(:one)
  end

  test "visiting the index" do
    visit portions_url
    assert_selector "h1", text: "Portions"
  end

  test "creating a Portion" do
    visit portions_url
    click_on "New Portion"

    fill_in "Contract historic", with: @portion.contract_historic_id
    fill_in "Number", with: @portion.number
    fill_in "Proof", with: @portion.proof
    fill_in "Status", with: @portion.status
    fill_in "Value", with: @portion.value
    click_on "Create Portion"

    assert_text "Portion was successfully created"
    click_on "Back"
  end

  test "updating a Portion" do
    visit portions_url
    click_on "Edit", match: :first

    fill_in "Contract historic", with: @portion.contract_historic_id
    fill_in "Number", with: @portion.number
    fill_in "Proof", with: @portion.proof
    fill_in "Status", with: @portion.status
    fill_in "Value", with: @portion.value
    click_on "Update Portion"

    assert_text "Portion was successfully updated"
    click_on "Back"
  end

  test "destroying a Portion" do
    visit portions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Portion was successfully destroyed"
  end
end

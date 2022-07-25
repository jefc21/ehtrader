require "application_system_test_case"

class ContractHistoricsTest < ApplicationSystemTestCase
  setup do
    @contract_historic = contract_historics(:one)
  end

  test "visiting the index" do
    visit contract_historics_url
    assert_selector "h1", text: "Contract Historics"
  end

  test "creating a Contract historic" do
    visit contract_historics_url
    click_on "New Contract Historic"

    fill_in "Contract", with: @contract_historic.contract_id
    fill_in "Num portion", with: @contract_historic.num_portion
    fill_in "Open date", with: @contract_historic.open_date
    fill_in "Status", with: @contract_historic.status
    fill_in "Value", with: @contract_historic.value
    click_on "Create Contract historic"

    assert_text "Contract historic was successfully created"
    click_on "Back"
  end

  test "updating a Contract historic" do
    visit contract_historics_url
    click_on "Edit", match: :first

    fill_in "Contract", with: @contract_historic.contract_id
    fill_in "Num portion", with: @contract_historic.num_portion
    fill_in "Open date", with: @contract_historic.open_date
    fill_in "Status", with: @contract_historic.status
    fill_in "Value", with: @contract_historic.value
    click_on "Update Contract historic"

    assert_text "Contract historic was successfully updated"
    click_on "Back"
  end

  test "destroying a Contract historic" do
    visit contract_historics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contract historic was successfully destroyed"
  end
end

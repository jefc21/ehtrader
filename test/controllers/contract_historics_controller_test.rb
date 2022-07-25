require "test_helper"

class ContractHistoricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract_historic = contract_historics(:one)
  end

  test "should get index" do
    get contract_historics_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_historic_url
    assert_response :success
  end

  test "should create contract_historic" do
    assert_difference('ContractHistoric.count') do
      post contract_historics_url, params: { contract_historic: { contract_id: @contract_historic.contract_id, num_portion: @contract_historic.num_portion, open_date: @contract_historic.open_date, status: @contract_historic.status, value: @contract_historic.value } }
    end

    assert_redirected_to contract_historic_url(ContractHistoric.last)
  end

  test "should show contract_historic" do
    get contract_historic_url(@contract_historic)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_historic_url(@contract_historic)
    assert_response :success
  end

  test "should update contract_historic" do
    patch contract_historic_url(@contract_historic), params: { contract_historic: { contract_id: @contract_historic.contract_id, num_portion: @contract_historic.num_portion, open_date: @contract_historic.open_date, status: @contract_historic.status, value: @contract_historic.value } }
    assert_redirected_to contract_historic_url(@contract_historic)
  end

  test "should destroy contract_historic" do
    assert_difference('ContractHistoric.count', -1) do
      delete contract_historic_url(@contract_historic)
    end

    assert_redirected_to contract_historics_url
  end
end

json.extract! contract_historic, :id, :value, :num_portion, :status, :open_date, :contract_id, :created_at, :updated_at
json.url contract_historic_url(contract_historic, format: :json)

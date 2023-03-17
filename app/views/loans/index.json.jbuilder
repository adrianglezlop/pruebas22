json.array!(@loans) do |loan|
  json.extract! loan, :id, :nombre
  json.url loan_url(loan, format: :json)
end

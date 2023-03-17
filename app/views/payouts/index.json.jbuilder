json.array!(@payouts) do |payout|
  json.extract! payout, :id, :nombre
  json.url payout_url(payout, format: :json)
end

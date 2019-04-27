json.extract! coupon, :id, :percentage, :expire_at, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)

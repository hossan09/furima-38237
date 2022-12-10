FactoryBot.define do
  factory :order_address do
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    area_id { 15 }
    municipalities { '横浜市' }
    address { '1-1' }
    phone_number { '09012345678' }
  end
end

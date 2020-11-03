FactoryBot.define do
  factory :order_form do
    token { 'tok_889d39fc9a831ea5f33ee3ecac83' }
    postalcode_id { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    housenumber { '青山1-1-1' }
    phonenumber { '09012345678' }
  end
end

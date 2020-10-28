FactoryBot.define do
  factory :item do
    product_name { 'aaa' }
    product_introduction { 'bbb' }
    product_category_id { 2 }
    product_status_id { 2 }
    delivery_burden_id { 2 }
    prefecture_id { 3 }
    delivery_day_id { 3 }
    price { 5000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

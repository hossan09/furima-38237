FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 2) }
    content           { 'testcode' }
    category_id       { rand(2..11) }
    situation_id      { rand(2..7) }
    charge_id         { rand(2..3) }
    area_id           { rand(2..48) }
    days_id           { rand(2..4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end

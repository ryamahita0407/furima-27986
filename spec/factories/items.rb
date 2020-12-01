FactoryBot.define do
  factory :item do
    association :user
    item_name             {"ぬいぐるみ"}
    item_text             {"くまのぬいぐるみです。新品でまだ袋も開けていない状態です"}
    category_id           {2}
    condition_id          {2}
    postage_id            {2}
    prefecture_id         {2}
    shipping_day_id       {2}
    price                 {999999}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

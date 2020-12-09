FactoryBot.define do
  factory :order_address do
    association :user
    association :item
    postcode              {"123-4567"}
    prefecture_id         {2}
    city                  {"北海道"}
    block                 {"札幌1-1-1"}
    building              {"札幌ハイツ"}
    phone_num             {"09012345678"}
    token                 {"tok_abcdefghijk00000000000000000"}

  end
end

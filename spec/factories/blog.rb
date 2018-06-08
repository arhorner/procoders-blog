FactoryBot.define do
  sequence :title do |n|
    "Test Post #{n}"
  end

  factory :article do
    title 
    text "test11111"
  end
end

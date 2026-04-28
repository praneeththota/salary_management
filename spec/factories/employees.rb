FactoryBot.define do
  factory :employee do
    full_name { Faker::Name.name }
    job_title { "Software Engineer" }
    country { "USA" }
    salary { 100000 }
    department { "Engineering" }
    email { Faker::Internet.unique.email }
  end
end

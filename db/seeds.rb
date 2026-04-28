require 'faker'

puts "Reading names..."
first_names = File.read('first_names.txt').split("\n")
last_names = File.read('last_names.txt').split("\n")

puts "Generating 10,000 records..."
# Prepare data in memory
employees = Array.new(10_000) do
  {
    full_name: "#{first_names.sample} #{last_names.sample}",
    job_title: [ "Software Engineer", "Product Manager", "Designer", "HR Manager" ].sample,
    country: [ "USA", "India", "UK", "Germany", "Canada" ].sample,
    salary: rand(40000..180000),
    department: [ "Engineering", "Product", "Sales", "HR" ].sample,
    email: Faker::Internet.unique.email,
    created_at: Time.current,
    updated_at: Time.current
  }
end

puts "Inserting into database..."
Employee.insert_all(employees)
puts "Successfully seeded 10,000 records."

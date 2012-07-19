Fabricator(:user) do
  email { Faker::Internet.email }
  password { Faker::Lorem.words(num = 3).join(' ') }
end

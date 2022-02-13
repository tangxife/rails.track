# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'create organization_1'

org1 = Organization.create!(
  name: 'organization_1',
  email: 'org1@email.com',
  tel: '028-6100001',
  postal_code: '610000',
  address: 'chengdu shuangliu',
  contacts: 'con1'
)

p 'create organization_2'

org2 = Organization.create!(
  name: 'organization_2',
  email: 'org2@email.com',
  tel: '028-6100002',
  postal_code: '610000',
  address: 'chengdu gaoxing',
  contacts: 'con2'
)

# p "create candidates"
#
# 5.times do |i|
#   Candidate.create!(
#     name: "t#{i}",
#     email: "candidate#{i}@test.com",
#     area_code: "81",
#     phone: "1878013231#{i}",
#     now_rog_name: "org#{i}",
#     organization_id: 1,
#     user_id: 1
#   )
# end
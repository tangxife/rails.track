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

p 'create org1_user1'

user1 = org1.users.create!(
  name: 'org1_user1',
  email: 'user1@email.com',
  password: "111111",
  phone: '15982363913',
  department: 'HR',
  role: 1,
  organization: org1
)

p 'create org1_other_user'

user_a = org1.users.create!(
  name: 'org1_user_a',
  email: 'user_a@email.com',
  password: "111111",
  phone: '15982363913',
  department: 'HR',
  role: 1,
  organization: org1
)

p 'create org1_user1_candidates'

15.times do |i|
  org1.candidates.create!(
    cid: "O1U1_#{i}",
    name: "org1_user1_candidate#{i}",
    email: "O1U1_#{i}@email.com",
    phone: '15982363913',
    area_code: '86',
    now_org_name: "now_org#{i}",
    now_industry: "IT",
    memo: "memo#{i}",
    user: user1,
    language: 1
  )
end

p 'create organization_2'

org2 = Organization.create!(
  name: 'organization_2',
  email: 'org2@email.com',
  tel: '028-6100002',
  postal_code: '610000',
  address: 'chengdu gaoxing',
  contacts: 'con2'
)

user2 = org2.users.create!(
  name: 'org2_user2',
  email: 'user2@email.com',
  password: "111111",
  phone: '15982363913',
  department: 'HR',
  role: 2,
  organization: org2
)

user_b = org2.users.create!(
  name: 'org1_user_b',
  email: 'user_b@email.com',
  password: "111111",
  phone: '15982363913',
  department: 'HR',
  role: 1,
  organization: org2
)

p 'create org2_user2_candidates'

15.times do |i|
  org2.candidates.create!(
    cid: "O2U2_#{i}",
    name: "org2_user2_candidate#{i}",
    email: "O2U2_#{i}@email.com",
    phone: '15982363913',
    area_code: '86',
    now_org_name: "now_org#{i}",
    now_industry: "FINANCE",
    memo: "memo#{i}",
    user: user2,
    language: 1
  )
end

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
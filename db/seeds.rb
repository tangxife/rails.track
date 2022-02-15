# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p 'create organization sln ...'

org = Organization.create!(
  name: 'sln',
  email: 'sln@email.com',
  tel: '028-6100001',
  postal_code: '610000',
  address: 'chengdu shuangliu',
  contacts: 'me'
)

p 'create other organization ...'

other_org = Organization.create!(
  name: 'other',
  email: 'other@email.com',
  tel: '028-6100002',
  postal_code: '610000',
  address: 'chengdu gaoxing',
  contacts: 'other'
)

p 'create other user ...'

other_user = other_org.users.create!(
  name: 'other_user',
  email: 'other_user@email.com',
  phone: '15982363913',
  password: '111111',
  department: 'HR',
  role: 1,
  organization: other_org
)

p 'create other_user_candidates'

15.times do |i|
  other_org.candidates.create!(
    cid: "o_u_#{i}",
    name: "o_u_candidate#{i}",
    email: "o_u_candidate#{i}@email.com",
    phone: '15982363913',
    area_code: '86',
    now_org_name: "now_org#{i}",
    now_industry: "FINANCE",
    memo: "memo#{i}",
    user: other_user,
    language: 1
  )
end
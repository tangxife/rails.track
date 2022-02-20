# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...



## note

command

```sh
docker-compose exec web bundle install
docker-compose exec web bin/rails g graphql:install
docker-compose exec web bin/rails generate migration CreateCandidate
docker-compose exec web bin/rails generate model candidate
docker-compose exec web bin/rails g graphql:object Candidate
docker-compose exec web bin/rails db:seed:replant
docker-compose exec web bin/rails db:migrate
docker-compose exec web bin/rails generate migration AddForeginKeyToCandidate
docker-compose exec web bundle exec rails generate graphql_devise:install User --mount AppSchema
```

## grephql

### [Defining Interface Types](https://graphql-ruby.org/type_definitions/interfaces.html#defining-interface-types)

接口（interface）是可以被对象实现的字段列表。

一个接口有多个字段，但是接口不会被真正的实例化。对象可以实现接口成为接口的对象。同样字段也可以返回一个接口类型。这种情况下返回的对象可能就是接口的成员。

For example, let’s say a `Customer` (interface) may be either an `Individual` (object) or a `Company` (object). Here’s the structure in the [GraphQL Schema Definition Language](https://graphql.org/learn/schema/#type-language)(SDL):

```ruby
interface Customer {
  name: String!
  outstandingBalance: Int!
}

type Company implements Customer {
  employees: [Individual!]!
  name: String!
  outstandingBalance: Int!
}

type Individual implements Customer {
  company: Company
  name: String!
  outstandingBalance: Int!
}
```




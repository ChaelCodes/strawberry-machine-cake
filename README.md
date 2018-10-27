# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.5.3

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Setup steps (For cloud 9 ide)
  * Create a cloud 9 project with Ruby on Rails template
  * set rvm version to 2.5.3 `rvm use 2.5.3`
  * install gems and their dependencies `bundle install`
  * start postgres database `sudo service postgresql start`
  * run database migrations `rake db:migrate`
  * start rails server `rails s -b $IP -p $PORT`

# README

## Pixie
Pixie is a story-telling content-generation web app that emulates social media. Build characters, and post what's happening on your character sheet or in a particular scenario.

## Ruby version: 2.5.3

## System dependencies

## Configuration

## Database creation

## Database initialization

## Documentation
https://www.rubydoc.info/github/ChaelCodes/strawberry-machine-cake/master/index

## How to run the test suite
`bundle exec rspec`

## Services (job queues, cache servers, search engines, etc.)
None - yet

## Deployment instructions
Pushing to master triggers the deployment pipe on Heroku.

## Setup steps (For cloud 9 ide)
  * Create a cloud 9 project with Ruby on Rails template
  * set rvm version to 2.5.3 `rvm use 2.5.3`
  * install gems and their dependencies `bundle install`
  * start postgres database `sudo service postgresql start`
  * run database migrations `rake db:migrate`
  * start rails server `rails s -b $IP -p $PORT`
  
## Setup Steps for Code Anywhere
Follow this: https://diver.diveintocode.jp/seminar_documents/rails00_codeanywhere_en#On%20the%20merits%20of%20using%20Codeanywhere%20and%20the%20work%20to%20be%20done%20today
 * Create a container (Ubuntu + Ruby)
 * rvm install 'ruby-2.5.3'
 * sudo apt-get install libpq-dev
 * bundle
 * sudo apt-get install postgresql postgresql-contrib
 * STEPS
 * sudo service postgresql start
 * rake db:reset

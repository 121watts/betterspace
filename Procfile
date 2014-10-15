redis: redis-server
worker1: bundle exec rake environment resque:work QUEUE=contact_us_email
worker2: bundle exec rake environment resque:work QUEUE=welcome_email

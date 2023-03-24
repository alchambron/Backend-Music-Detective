# Backend - Music Detective

bundle install

sudo service postgresql start

rails db:create

rails db:migrate

rails db:seed

rails server

Versions
Ruby 3.0.0 Rails', '~> 7.0.4', '>= 7.0.4.2'

We used Ruby On Rails to store user information in a database, including an email address, a password and all his game statistics (points collected, number of games played, etc.)
Ruby On Rails has been configured in api mode to retrieve, send information to the frontend and also retrieve them modified and then store them.

A system of sending mail has been set up at the time of connection to inform the user that he is well connected to our site.
A system of sending mail was set up for the recovery of forgotten password.


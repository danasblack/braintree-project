# README

This application was developed using the Ruby as the server-side language

Please note the following:

Braintree gem is included in the gemfile

config/initializers/braintree.rb where Braintree is initialized with environment variables

app/controllers/checkouts_controller.rb, a controller that prepares stores the card and creates the transaction

app/views/checkouts/new.html.erb, a view where Hosted Fields is initialized




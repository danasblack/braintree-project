class CheckoutsController < ApplicationController
	require 'dotenv'

	def index
	end 

	def new
		@client_token = Braintree::ClientToken.generate
	end

	def create
		amount = params["amount"] 
		nonce_from_the_client = params[:payment_method_nonce]

		@customer = Braintree::Customer.create(
			:first_name => "Charity",
			:last_name => "Smith",
			:payment_method_nonce => nonce_from_the_client
			)

		@payment_method = Braintree::PaymentMethod.create(
			:customer_id => @customer.customer.id,
			:payment_method_nonce => nonce_from_the_client,
			:options => {
				:verify_card => true
			}
			)

		@result = Braintree::Transaction.sale(
			:amount => "10.00",
			:payment_method_token => @customer.customer.payment_methods[0].token,
			:options => {
				:submit_for_settlement => true
			}
			)
	end
end 


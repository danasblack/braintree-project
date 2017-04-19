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

    @result =  Braintree::PaymentMethod.create(
         :customer_id => "131866",
         :payment_method_nonce => nonce_from_the_client
  )
  end
end


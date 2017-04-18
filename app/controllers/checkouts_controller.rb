class CheckoutsController < ApplicationController
	require 'dotenv'

	def new
		@client_token = Braintree::ClientToken.generate
	end

	def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce_from_the_client = params[:payment_method_nonce]

    @result = Braintree::Transaction.sale(
    	:amount => "20.00",
    	:payment_method_nonce => nonce_from_the_client,
    	:options => {
    		:submit_for_settlement => true
    	}
    	)
  end
end


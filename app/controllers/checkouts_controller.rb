class CheckoutsController < ApplicationController
	require 'dotenv'

  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

	def new
		@client_token = Braintree::ClientToken.generate
	end

	def show
		@transaction = Braintree::Transaction.find(params[:id])
		@result = _create_result_hash(@transaction)
	end

	def create
    amount = params["amount"] # In production you should not take amounts directly from clients
    nonce = params["payment_method_nonce"]

    result = Braintree::Transaction.sale(
    	amount: amount,
    	payment_method_nonce: nonce,
    	:options => {
    		:submit_for_settlement => true
    	}
    	)
   end
end


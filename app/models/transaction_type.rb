class TransactionType < ActiveRecord::Base
	belongs_to :acct_transaction
end

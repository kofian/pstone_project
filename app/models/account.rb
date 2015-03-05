class Account < ActiveRecord::Base
	# self.primary_key = "id"

	belongs_to :customer
	belongs_to :user
	has_one :account_type
	has_many :acct_transactions
end

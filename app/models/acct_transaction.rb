# Barnabas Bulpett
# WEB-289-YD1
# Spring 2015
# acct_transaction.rb

# Definitions and validations pertaining to the AcctTransaction model
class AcctTransaction < ActiveRecord::Base
	
	belongs_to :account
	has_one :transaction_type

	accepts_nested_attributes_for :transaction_type, :allow_destroy => false
	validates_numericality_of :amount
	validate :funds_availability

	def funds_availability
		if self.transaction_type_id == 7 && self.amount > Account.find(self.account_id).balance
			errors.add(:amount, 'INSUFFICIENT FUNDS!! Please try again')
		end
	end
end

class AcctTransaction < ActiveRecord::Base
	# self.primary_key = "id"

	
	belongs_to :account
	has_one :transaction_type

	accepts_nested_attributes_for :transaction_type, :allow_destroy => false
	validates_numericality_of :amount
end

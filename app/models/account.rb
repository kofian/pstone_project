class Account < ActiveRecord::Base
	belongs_to :customer
	belongs_to :user
	has_one :acct_type
	has_many :acct_transactions

	accepts_nested_attributes_for :acct_type
	accepts_nested_attributes_for :acct_transactions

	validates :acct_type_id, presence: true

end

class Address < ActiveRecord::Base
	# self.primary_key = "customer_id"
	
	belongs_to :customer
	belongs_to :user

	validates_presence_of :zip_code
	
	has_one :zip_code
	has_one :state, through: :zip_code
end

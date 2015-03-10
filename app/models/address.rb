class Address < ActiveRecord::Base
	belongs_to :customer
	belongs_to :user

	validates :zip_code_zip_code, presence: true
	validates :address1, presence: true

	has_one :zip_code
	has_one :state, through: :zip_code
end

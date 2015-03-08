class Customer < ActiveRecord::Base
	
	belongs_to :user
	has_one :address
	has_many :accounts

	validates :phone1, :firstname, :lastname, presence: true
end

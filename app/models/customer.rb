class Customer < ActiveRecord::Base
	
	belongs_to :user
	has_one :address, :dependent => :destroy
	has_many :accounts, :dependent => :destroy

	validates :phone1, :firstname, :lastname, presence: true
	accepts_nested_attributes_for :accounts, :allow_destroy => true
	accepts_nested_attributes_for :address, :allow_destroy => true
end

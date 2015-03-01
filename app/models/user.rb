class User < ActiveRecord::Base
  before_create :generate_id

  has_many :customers
  has_many :administrators

  validates_uniqueness_of :email, :case_sensitive => false
  validates_uniqueness_of :id

  # User ID is a generated uuid
  include ActiveUUID::UUID
  natural_key :user_id, :remember_created_at
  belongs_to :user
  # specify custom UUID namespace for the natural key
  uuid_namespace "1dd74dd0-d116-11e0-99c7-5ac5d975667e"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Generate a random uuid for new user id creation
  def generate_id
  	self.id = SecureRandom.uuid
  end

  # Allow signin by either email or username
  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	where(conditions).where(['lower(username) = :value OR lower(email) = :value', { :value => signin.downcase }]).first
  end  
end

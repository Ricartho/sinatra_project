class User < ActiveRecord::Base
  validates :pseudo, presence: true
	validates :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }
	has_secure_password
  has_many :categories
  has_many :authors
  has_many :articles
end

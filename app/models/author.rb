class author < ActiveRecord::Base
  validates :first_name,presence: true
  validates :last_name,presence: true
  belongs_to :user 
  has_many :articles
end

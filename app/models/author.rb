class Author < ActiveRecord::Base
  validates :first_name,presence: true
  validates :last_name,presence: true
  belongs_to :user
  has_many :articles

  def fixed_name
    self.first_name.capitalize + ' ' + self.last_name.upcase
  end
end

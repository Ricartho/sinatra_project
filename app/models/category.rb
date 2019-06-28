class Category <  ActiveRecord::Base
  validates :category_name,presence: true
  validates :category_name,uniqueness: { case_sensitive: false }
  belongs_to :user
  has_many :articles
end

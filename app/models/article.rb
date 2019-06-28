class Article < ActiveRecord::Base
  validates :article_name,presence: true
  validates :article_name,uniqueness: { case_sensitive: false }
  belongs_to :user
  belongs_to :category
  belongs_to :author

end

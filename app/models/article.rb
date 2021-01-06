class Article < ApplicationRecord
  # many to one relationship
  belongs_to :user

  # many to many relationship
  has_many :article_categories
  has_many :categories, through: :article_categories

  # This automaticly give getter/setter methods
  # but need enforce validation and contraint 
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end
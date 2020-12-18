class Article < ApplicationRecord
  belongs_to :user
  # This automaticly give getter/setter methods
  # but need enforce validation and contraint 
  validates :title, presence: true, length: {minimum: 6, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end
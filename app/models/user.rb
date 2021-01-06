class User < ApplicationRecord
  before_save { self.email = email.downcase }

  # one to many relationship
  # dependent: :destroy would delete all children articles
  has_many :articles, dependent: :destroy
  
  # many to many relationship
  

  # can read more at https://guides.rubyonrails.org/active_record_validations.html
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: {minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: {maximum: 105},
                    format: {with: VALID_EMAIL_REGEX}

  # can read more here https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password
end
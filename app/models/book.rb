class Book < ApplicationRecord
  has_many :users, through: :user_books
  has_many :lessons, dependent: :destroy
end

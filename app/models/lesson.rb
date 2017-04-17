class Lesson < ApplicationRecord
  belongs_to :book
  has_many :words, dependent: :destroy
end

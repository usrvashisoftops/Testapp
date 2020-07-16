class Topic < ApplicationRecord
  has_many :users
  has_many :questions
  has_many :answers
end

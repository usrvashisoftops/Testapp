class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  belongs_to :topic
  validates :text, presence: true
end

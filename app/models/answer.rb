class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
end

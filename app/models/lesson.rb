class Lesson < ActiveRecord::Base
  has_many :lesson_words
  has_many :words, through :lesson_words
  belongs_to :user  
end

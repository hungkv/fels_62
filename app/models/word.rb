class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
  accepts_nested_attributes_for :answers

  validates :content, presence: true
  validates :category, presence: true
  
  self.per_page = Settings.will_per
end

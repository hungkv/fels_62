class Lesson < ActiveRecord::Base
  has_many :lesson_words
  has_many :words, through: :lesson_words
  has_many :answers, through: :lesson_words
  belongs_to :user
  belongs_to :category
  after_create :random_20_words
  accepts_nested_attributes_for :lesson_words

  validates :user, :category, presence: true

  scope :sum_learned, ->{joins(:lesson_words, :answers).where("answers.is_true = (?)", true).count}
  
  def mark_point
    "#{self.lesson_words.answered.count} / #{self.lesson_words.count}"
  end

  private
  def random_20_words
    category = Category.find self.category_id
    category.words.sample(20).each do |word|
      lesson_word = self.lesson_words.build word_id: word.id
      lesson_word.save
    end
  end
end

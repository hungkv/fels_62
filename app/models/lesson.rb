class Lesson < ActiveRecord::Base
  has_many :lesson_words
  has_many :words, through: :lesson_words
  belongs_to :user
  after_create :random_20_words

  private
  def random_20_words
    category = Category.find self.category_id
    category.words.sample(20).each do |word|
      lesson_word = self.lesson_words.build word_id: word.id
      lesson_word.save
    end
  end
end

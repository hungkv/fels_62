class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lesson_words
  has_many :lessons, through: :lesson_words
  accepts_nested_attributes_for :answers

  validates :content, presence: true
  validates :category, presence: true
  
  self.per_page = Settings.will_per

  scope :get_all, ->user{}
  scope :get_learned, ->user{joins(:lesson_words, :lessons).where(lessons: {user_id: user.id}).uniq
                                                           .where.not(lesson_words: {answer_id: nil})}
  scope :get_not_learned, ->user{joins(:lesson_words, :lessons).where(lessons: {user_id: user.id}).uniq
                                                               .where(lesson_words:{answer_id: nil})}

  STATUS = ["all", "learned", "not_learned"]
end

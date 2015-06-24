class LessonWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
  belongs_to :answer

  validates :lesson, :word, :answer, presence: true

  scope :answered, ->{where.not(answer_id: nil)}
end

class Category < ActiveRecord::Base
  has_many :words
  has_many :lessons
  accepts_nested_attributes_for :words

  validates :title, presence: true
  
  self.per_page = Settings.will_per
end

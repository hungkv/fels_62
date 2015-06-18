class Category < ActiveRecord::Base
  has_many :words
  has_many :lessons
  accepts_nested_attributes_for :words
  
end

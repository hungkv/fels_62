# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Word.delete_all
Answer.delete_all

(1..3).each do |value|
  title = Faker::Name.title
  description = Faker::Lorem.sentence
  Category.create title: title, description: description
end

# Create words data
Category.all.each do |category|
  (1..50).each do |value|
    word_content = Faker::Lorem.word
    category.words.create content: word_content
  end
end

# Create answer for each word
Word.all.each do |word|
  (1..4).each_with_index do |value,index|
    answer_value = Faker::Lorem.word
    if index == 1
      word.answers.create content: answer_value, is_true: true
    else
      word.answers.create content: answer_value, is_true: false
    end
  end
end

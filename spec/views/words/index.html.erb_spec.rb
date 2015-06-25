require 'rails_helper'

RSpec.describe "words/index", type: :view do
  before :each do
    @category = FactoryGirl.create :category_with_word
    @categories = Category.all
  end

  it "displays all words of category" do
    @words = @category.words
    render
    expect(view).to render_template partial: "_word"
  end
end

require 'rails_helper'

RSpec.describe "lessons/show", type: :view do
  before :each do
    @lesson = FactoryGirl.create(:lesson)
    @lesson_words = @lesson.lesson_words
  end

  it "request to lesson controller and show action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "lessons"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  it "display title of show action" do 
    render
    expect(rendered).to include @lesson.category.title
  end
end

require 'rails_helper'

RSpec.describe "lessons/edit", type: :view do
  before :each do
    @lesson = FactoryGirl.create(:lesson)
  end

  it "request to lesson controller and edit action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "lessons"
    expect(controller.request.path_parameters[:action]).to eq "edit"
  end

  it "display title of edit action" do 
    render
    expect(rendered).to include @lesson.category.title
  end
end

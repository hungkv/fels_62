require 'rails_helper'

RSpec.describe "categories/_category", type: :view do
  let!(:category) {FactoryGirl.build :category}
  
  it "display _category partial" do
    render "categories/category", category: category
    expect(rendered).to include category.title
  end
end

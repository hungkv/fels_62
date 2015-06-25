require 'rails_helper'

RSpec.describe "admin/categories/_category", type: :view do
  before :each do 
    @category = FactoryGirl.create :category
  end

  it "no render from other action directly" do
    expect(controller.request.path_parameters[:action]).to be_nil
  end

  it "display list of all subject for admin to select for create question" do
    render "admin/categories/category", category: @category
    expect(rendered).to include @category.title
  end
end

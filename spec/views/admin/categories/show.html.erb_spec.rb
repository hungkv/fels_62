require 'rails_helper'

RSpec.describe "admin/categories/show", type: :view do
  before :each do 
    @category = FactoryGirl.create :category
  end

  it "request to admin category controller and show action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admin/categories"
    expect(controller.request.path_parameters[:action]).to eq "show"
  end

  it "display title of show action" do 
    render
    expect(rendered).to include @category.title
  end
end

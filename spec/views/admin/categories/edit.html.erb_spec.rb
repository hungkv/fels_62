require 'rails_helper'

RSpec.describe "admin/categories/edit", type: :view do
  before :each do
    @category = FactoryGirl.create(:category)
  end

  it "request to admin category controller and edit action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admin/categories"
    expect(controller.request.path_parameters[:action]).to eq "edit"
  end

  it "display title of edit action" do 
    render
    expect(rendered).to include @category.title
  end
end

require 'rails_helper'

RSpec.describe "admin/categories/_modal", type: :view do
  before :each do 
    @category = Category.new
  end

  it "no render from other action directly" do
    expect(controller.request.path_parameters[:action]).to be_nil
  end

  it "display list of all subject for admin to select for create question" do
    render
    expect(rendered).to include "Save"
  end
end

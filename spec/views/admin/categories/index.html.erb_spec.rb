require 'rails_helper'

RSpec.describe "admin/categories/index", type: :view do
  before :each do 
    @category = FactoryGirl.create :category
    @categories = Category.all.paginate page: params[:page]
  end

  it "request to admin category controller and index action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admin/categories"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it "should response to show list categories" do
    render
    expect(rendered).to include "myModal"
  end
end

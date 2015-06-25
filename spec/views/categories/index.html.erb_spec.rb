require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  let!(:category) {FactoryGirl.create :category}

  before :each do 
    @categories = Category.all.paginate page: params[:page], per_page: Settings.will_per
  end

  it "show all category" do
    render
    expect(view).to render_template partial: "_category"
  end

  it "contain title" do
    render
    expect(rendered).to match category.title
  end
end

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category) {FactoryGirl.build :category}
  
  describe "Get #index" do 
    it "populates an array of categories" do 
      get :index
      expect(response).to render_template "index"
    end
  end
end

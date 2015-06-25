require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  let!(:category) {FactoryGirl.create :category}
  let!(:word) {FactoryGirl.create :word}
  context "GET/index" do 
    it "populate an words array" do
      get :index
      expect(response).to render_template "index"
    end
  end
end

require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do
  let!(:category) {FactoryGirl.create :category}

  describe "GET #index" do
    it "should response to display list all admin categories" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #edit" do
    it "should response to display admin categories information" do
      get :edit, id: category.id
      expect(response).to render_template "edit"
    end
  end

  describe "GET #show" do
    it "should response to admin categories infomation" do
      get :show, id: category.id
      expect(response).to render_template "show"
    end
  end

  describe "POST #create" do
    let!(:params) {{category: {title: Faker::Name.title}}}
    it "should present flash success" do
      post :create, params
      expect(flash[:success]).to be_present
    end

    it "should present flash danger" do
      params[:title] = nil
      post :create, params
      expect(flash[:danger]).to be_nil
    end
  end

  describe "PATCH #update" do
    let!(:params) {{category: {title: Faker::Name.title}, id: category.id}}

    it "should present flash success" do
      patch :update, params
      expect(flash[:success]).to be_present
    end

    it "should present flash danger" do 
      params[:title] = ""
      patch :update, params
      expect(flash[:danger]).to be_nil
    end
  end

  describe "DELETE #destroy" do
    it "should present flash success" do
      delete :destroy, id: category.id
      expect(flash[:success]).to be_present
    end

    it "should present flash danger" do
      delete :destroy, id: ""
      expect(flash[:danger]).to eq "Category delete faild"
    end
  end
end

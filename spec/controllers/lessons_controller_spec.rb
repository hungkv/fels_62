require 'rails_helper'

RSpec.describe LessonsController, type: :controller do
  let!(:category) {FactoryGirl.create :category}
  let!(:user) {FactoryGirl.create :user}
  let!(:lesson) {category.lessons.create user: user}
  before :each do
    sign_in user
  end

  describe "GET #edit" do
    it "should response to display lesson information" do
      get :edit, id: lesson.id
      expect(response).to render_template "edit"
    end
  end

  describe "GET #show" do
    it "should response to lesson infomation" do
      get :show, id: lesson.id
      expect(response).to render_template "show"
    end
  end

  describe "POST #create" do
    let(:params) {{category_id: category.id}}
    it "should redirect to lesson path" do
      post :create, params
      expect(response).to redirect_to edit_lesson_path Lesson.last
    end

    it "should redirect to sign in" do
      sign_out :user
      post :create, params
      expect(response).to redirect_to new_user_session_path
    end

    it "should redirect to sign in" do
      params[:category_id] = nil
      post :create, params
      expect(response).to redirect_to categories_path
    end
  end

  describe "PATCH #update" do
    let(:params) {{id: lesson.id, lesson: {lesson_words_attributes: {}}}}
    before :each do
      lesson.lesson_words.each_with_index do |word_lesson, index|
        params[:lesson][:lesson_words_attributes].merge!("#{index}": {answer_id: word_lesson.word.answers.random.id, id: word_lesson.id})
      end
    end 

    it "should redirect_to lesson_path" do
      patch :update, params
      expect(response).to redirect_to lesson_path lesson
    end

    it "should redirect_to categories_path" do 
      params[:id] = ""
      patch :update, params
      expect(response).to redirect_to categories_path
    end
  end
end

require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let (:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_question] to @question" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end 
  end

  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: my_question.id}
      expect(response).to render_template :show
    end 

    it "assigns my_post  to @post" do
      get :show, params: {id: my_question.id}
      expect(assigns(:question)).to eq(my_question)
    end 
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end 
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, params: {id: my_question.id}
      expect(response).to have_http_status(:success)
    end
  end

end

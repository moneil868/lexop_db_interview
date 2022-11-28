require 'rails_helper'

RSpec.describe "/articles", type: :request do
  
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Article.create! valid_attributes
      get articles_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      article = Article.create! valid_attributes
      get article_url(article)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_article_url
      expect(response).to be_successful
    end
  end
end

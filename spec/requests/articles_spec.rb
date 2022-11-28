require 'rails_helper'

RSpec.describe "/", type: :request do
  
  let(:article) { 
    Article.create(title: "Montreal Hawks Minor League Baseball Team Wins Championship",
      slug: "Montreal Hawks Minor League Baseball Team Wins Championship".parameterize,
      excerpt: "Lorem ipsum",
      author: "John Snow",
      publication_date: DateTime.now,
      category: "Sports")
   }

  describe "GET /index" do
    it "renders a successful response" do
      get articles_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response if article exists" do
      
      get article_url(article.slug)
      expect(response).to be_successful
    end

    it "renders a not found response if article does not exists" do
      
      get article_url("1")
      response.code.should eq("404")
    end
  end
end

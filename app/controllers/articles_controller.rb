class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show ]

  def index
    @categories = Article.distinct.pluck(:category)
    @authors = Article.distinct.pluck(:author)

    case 
    when category_params.present? && author_params.present?
      @articles = Article.where(
        category: category_params,
        author: author_params
      ).order("title")
        .page params[:page]
    when category_params.present?
      @articles = Article.where(
        category: category_params
      ).order("title")
        .page params[:page]
    when author_params.present?
      @articles = Article.where(
        author: author_params
      ).order("title")
        .page params[:page]
    else
      @articles = Article.order("title")
      .page params[:page]
    end

  end

  def show
    file_path = "#{@article.title.gsub(/[%.:']/, '').gsub(/[^\w]/, '_')}.html"
    @file_content = File.read(Rails.root.join("data", file_path), encoding: "ISO-8859-1").encode
    @likes = @article.likes.order('date DESC').limit(10)
  end

  def to_param
    slug
  end
  
  private def set_article
    @article = Article.find_by(slug: params[:id]) || render_404
  end

  private def category_params
    params.fetch(:categories, nil)
  end

  private def author_params
    params.fetch(:authors, nil)
  end
end

class Api::V1::ArticlesController < Api::V1::BaseController
  include Pagination

  def show
    article = Article.published.find(params[:id])
    render json: article
  end

  def index
    articles = Article.published.order(created_at: :desc).page(params[:page] || 1).per(10).includes(:user)
    render json: articles, meta: pagination(articles), adapter: :json
  end
end

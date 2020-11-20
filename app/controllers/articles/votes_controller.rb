class Articles::VotesController < ApplicationController
  before_action :require_signin
  before_action :set_article

  def create
    @article.votes.create!(user: current_user)
    redirect_to @article
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end

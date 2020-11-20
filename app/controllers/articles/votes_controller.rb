class Articles::VotesController < ApplicationController
  before_action :require_signin
  before_action :set_article

  def create
    @article.votes.where(user: current_user).first_or_create
    redirect_to @article
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end

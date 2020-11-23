class Articles::VotesController < ApplicationController
  before_action :require_signin
  before_action :set_article

  def create
    @article.votes.where(user_id: current_user.id).first_or_create
    redirect_to request.referrer
  end

  def destroy
    @article.votes.where(user_id: current_user.id).destroy_all
    redirect_to request.referrer
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end

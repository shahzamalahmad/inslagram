class StaticPagesController < ApplicationController
  def landing_page
  end

  def dashboard
    @articles = Article.all
  end
end

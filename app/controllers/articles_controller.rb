class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[edit update distroy ]
  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
     mark_notifications_as_read
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_url(@article), notice: "photo was successfully posted." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to articles_url(@article), notice: "photo was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
    # binding.pry
    # @article.destroy

    # respond_to do |format|
    #   format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end
  def like
    # binding.pry
    @article = Article.all.find(params[:article_id])
    Like.create(user_id: current_user.id, article_id: @article.id)
    redirect_to articles_path(@article)
  end

  def correct_user
         @article = current_user.articles.find_by(id: params[:id])
          redirect_to articles_path, notice: "Not authorised to this article..." if @article.nil?
 end

 
  def mark_notifications_as_read
    if current_user
      notifications_to_mark_as_read = @article.notifications_as_article.where(recipient: current_user)
      notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:caption, :image, :status, :user_id, :title)
    end
end

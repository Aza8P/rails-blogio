class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  # GET /articles or /articles.json
  def index
    if params[:query]
      @articles = Article.includes(:user).where(is_public: true).where('title ILIKE ?', "%#{params[:query]}%").order(created_at: :desc).page(params[:page]).per(8)
    elsif params[:my_articles]
      @articles = current_user.articles.includes(:user).order(created_at: :desc).page(params[:page]).per(8)
    else
      @articles = Article.all.includes(:user).where(is_public: true).order(created_at: :desc).page(params[:page]).per(8)
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article.increment!(:readings)
    @author = User.find(@article.user_id).username
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
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was deleted.'
  end

  def my_articles
    @articles = current_user.articles
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :is_public, :published_at, :user_id)
    end
end

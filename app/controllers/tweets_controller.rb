class TweetsController < ApplicationController
  before_filter :find_tweet, only: [:show, :edit, :update, :destroy, :upvote]
  before_filter :check_if_admin, only: [:index, :edit, :update, :destroy, :create, :new]


  def index
    @tweets = Tweet.all
  end

  def new
  @tweet = Tweet.new
  @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def edit
    @tweet = Tweet.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.category_id = params[:category_id]
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    unless @tweet
      render text: "Page not here", status: 404
    end
  end

  def update
        @tweet = Tweet.find(params[:id])
        @tweet.category_id = params[:category_id]

    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweets_url, notice: 'Tweet was successfully updated.' }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully deleted.' }
      format.js
    end
  end

  private
    def find_tweet
      @tweet = Tweet.where(id: params[:id]).first
      render_404 unless @tweet
    end
    def tweet_params
      params.require(:tweet).permit(:title, :text, :category_id)
    end

end

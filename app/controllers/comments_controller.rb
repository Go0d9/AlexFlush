class CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.create(comment_params)
    @comment.commenter = current_user.email
    @comment.save
    respond_to do |format|
      format.html {redirect_to tweet_path(@tweet), notice: 'Comment was successfully create.' }
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to tweet_path(@tweet), notice: 'Comment was successfully deleted.' }
      format.js
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:commenter , :body)
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @tweet = Tweet.find(params[:tweet_id]) # finds the tweet with the associated tweet_id
    @comment = @tweet.comments.create(comment_params) # creates the comment on the tweet passing in params
    @comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
    @comment.save!

    redirect_to tweet_path(@tweet)
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(@tweet)
  end

  def comment_params
    params.require(:comment).permit(:name, :response)
  end

end
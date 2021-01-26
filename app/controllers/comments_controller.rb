class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @tweet = Tweet.find_by_id(params[:tweet_id])
    @comment = current_user.comments.create(comment_params)
    @comment.tweet_id = params[:tweet_id]

    unless @comment.save
      @errors = @comment.errors.full_messages
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

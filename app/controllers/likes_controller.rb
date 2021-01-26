class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @tweet = Tweet.find_by_id(params[:tweet_id])
    @like = current_user.likes.find_or_initialize_by(tweet_id: params[:tweet_id])
    @like.is_active = true
    unless @like.save
      @errors = @like.errors.full_messages
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find_by_id(params[:tweet_id])
    @like = Like.find_by(id: params[:id], user: current_user, tweet_id: params[:tweet_id])
    unless @like.update_attributes(is_active: false)
      @errors = @like.errors.full_messages
    end
    respond_to do |format|
      format.js
    end
  end
end

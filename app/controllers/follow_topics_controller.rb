class FollowTopicsController < ApplicationController
  def create
    p @follow_topic = FollowTopic.where(topic_id: params[:follow_topic][:topic_id], user_id: params[:follow_topic][:user_id])
    if @follow_topic.present?
      flash[:alert] = "Already Following this Topic"
      redirect_back(fallback_location: question_path(params[:question_id]))
    else
      @follow_topic = FollowTopic.create(follow_users_params)
      @follow_topic.save
      if @follow_topic.persisted?
        flash[:alert] = "Topic Followed"
        redirect_back(fallback_location: question_path(params[:question_id]))
      else
        flash[:alert] = "Topic Not Followed"
        redirect_back(fallback_location: question_path(params[:question_id]))
      end  
    end
  end
  private
  def follow_users_params
    params.require(:follow_topic).permit(:topic_id, :user_id)
  end
end
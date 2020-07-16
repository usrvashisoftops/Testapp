class FollowUsersController < ApplicationController
  def create
    p @follow_user = FollowUser.where(folow_user_id: params[:follow_user][:folow_user_id], user_id: params[:follow_user][:user_id])
    if @follow_user.present?
      flash[:alert] = "Already Following"
      redirect_back(fallback_location: question_path(params[:question_id]))
    else
      @follow_user = FollowUser.create(follow_users_params)
      @follow_user.save
      if @follow_user.persisted?
        flash[:alert] = "User Followed"
        redirect_back(fallback_location: question_path(params[:question_id]))
      else
        flash[:alert] = "User Not Followed"
        redirect_back(fallback_location: question_path(params[:question_id]))
      end  
    end
  end
  private
  def follow_users_params
    params.require(:follow_user).permit(:folow_user_id, :user_id)
  end
end
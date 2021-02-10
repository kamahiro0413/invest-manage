class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to group_investment_path(id: @comment.investment.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to group_investment_path(id:@comment.investment.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, investment_id: params[:investment_id])
  end
end

class GroupsController < ApplicationController
  def index
    # @user = User.find(params[:id])
    # @group = Group.includes(:user)
    # @investment = Investment.includes(:user)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end

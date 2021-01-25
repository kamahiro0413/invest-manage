class GroupsController < ApplicationController
  before_action :set_total, only: :show
  before_action :set_category_sum, only: :show

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

  def show
    @group = Group.find(params[:id])
    @investment = Investment.where(group_id: @group)
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_total
    @group = Group.find(params[:id])
    @investments = @group.investments
    @total = Investment.where(group_id: @group).sum(:money)
  end

  def set_category_sum
    @category2 = @group.investments.where(category_id: "2").pluck(:money).sum
    @category3 = @group.investments.where(category_id: "3").pluck(:money).sum
    @category4 = @group.investments.where(category_id: "4").pluck(:money).sum
    @category5 = @group.investments.where(category_id: "5").pluck(:money).sum
    # @category4 = @group.investments.where(category_id: "4").pluck(:money).sum
    # @category4 = @group.investments.where(category_id: "4").pluck(:money).sum
  end  
end

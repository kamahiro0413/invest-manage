class GroupsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
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
    @investments = @group.investments
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end

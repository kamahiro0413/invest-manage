class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  def index
    @group = Group.find(params[:group_id])
    @investments = @group.investments
    @total = Investment.where(group_id: @group).sum(:money)
  end

  def new
    @investment = Investment.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @investment = @group.investments.new(investment_params)
    if @investment.save
      redirect_to group_investments_path(@group)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @investment.update(investment_params)
      redirect_to group_investment_path
    else
      render :edit
    end
  end

  def destroy
    @investment.destroy
    redirect_to action: 'index'
  end

  private

  def investment_params
    params.require(:investment).permit(:content, :start_time, :money, :category_id, :account_id,
                                       :period_id).merge(user_id: current_user.id)
  end

  def set_investment
    @investment = Investment.find(params[:id])
  end
end

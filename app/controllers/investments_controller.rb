class InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:index, :create, :new]
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  def index
    @investments = @group.investments
  end

  def new
    @investment = Investment.new
  end

  def create
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
    unless @investment.user.id == current_user.id
      redirect_to root_path
    end
  end

  def update
    if @investment.update(investment_params)
      redirect_to group_investment_path
    else
      render :edit
    end
  end

  def destroy
    if @investment.user.id == current_user.id
      @investment.destroy
      redirect_to action: 'index'
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:content, :start_time, :money, :category_id, :account_id,
                                       :period_id).merge(user_id: current_user.id)
  end

  def set_investment
    @investment = Investment.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end

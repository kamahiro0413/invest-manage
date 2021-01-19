class InvestmentsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    # @investment = Investment.find(investment_params)
    # @investments = @group.investment
   
    @investments = @group.investments
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
   @user = User.find(params[:id])
   @investment = Investment.find(params[:id]) 
  end

  private

  def investment_params
    params.require(:investment).permit(:content,:start_time,:money,:category_id,:account_id,:period_id).merge(user_id: current_user.id)
  end

end

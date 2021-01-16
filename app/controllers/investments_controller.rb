class InvestmentsController < ApplicationController

  def index
    @investment = Investment.new
    @group = Group.find(params[:group_id])
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

  private

  def investment_params
    params.require(:investment).permit(:content,:date,:money,:category,:account,:period).merge(user_id: current_user.id)
  end

end

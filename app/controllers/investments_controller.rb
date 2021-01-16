class InvestmentsController < ApplicationController

  def index
    @investment = Investment.new
    @group = Group.find(params[:group_id])
  end

  def new
  end

end

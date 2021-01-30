class UsersController < ApplicationController
  
  def show
    @investment = current_user.investments
  end
end

class LeaderboardController < ApplicationController
  def index
  @users = User.order('points DESC')
  
  end
  def show

  end
end

class GoalsController < ApplicationController
  before_action :find_goal

  def index
    @goals = Goal.all
  end

  def show
    
  end

  private
  def find_goal
    @goal = Goal.find params[:id]
  end
end

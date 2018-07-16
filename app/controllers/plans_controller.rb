class PlansController < ApplicationController
  before_action :find_plan, except: [:index, :create, :new]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create plan_params
    render 'show', plan: @plan
  end

  def show
  end

  def edit
  end

  def update
    @plan.update(plan_params)
  end

  def destroy
    @plan.delete
    redirect_to plans_path
  end

  protected
    def find_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:title, event_attributes: [:title, :type, :start, :end])
    end
end
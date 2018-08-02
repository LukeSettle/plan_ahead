class ParentEventsController < ApplicationController
  before_action :find_parent_event, except: [:index, :create, :new]

  def index
    @parent_events = ParentEvent.all
  end

  def new
    @parent_event = ParentEvent.new
  end

  def create
    @parent_event = ParentEvent.new parent_event_params
    if @parent_event.save
      redirect_to send("new_#{@parent_event.kind}_event_path", parent_event_id: @parent_event.id)
    else
      flash[:alert] = @parent_event.errors if @parent_event.errors.any?
      render :new, plan_id: @parent_event.plan_id
    end
  end

  def show
  end

  def edit
  end

  def update
    if @parent_event.update(parent_event_params)
      redirect_to "#{@parent_event.kind}_events/form"
    else
      flash[:alert] = @parent_event.errors if @parent_event.errors.any?
      render :edit
    end
  end

  def destroy
    @parent_event.destroy
    render @parent_event.plan
  end

  protected
    def find_parent_event
      @parent_event = Event.find(params[:id])
    end

    def parent_event_params
      params.require(:parent_event).permit(:title, :kind, :plan_id)
    end
end
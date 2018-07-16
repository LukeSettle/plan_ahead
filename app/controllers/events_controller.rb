class EventsController < ApplicationController
  before_action :find_event, except: [:index, :create, :new]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create event_params
    flash[:alert] = @event.errors if @event.errors.any?
    redirect_to plan_path(event_params[:plan_id])
  end

  def show
  end

  def edit
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  protected
    def find_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :kind, :starts_at, :ends_at, :plan_id)
    end
end
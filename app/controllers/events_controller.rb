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
      @event = event.find(params[:id])
    end

    def event_params
      params.require(:plan).permit(:title, :type, :start, :end, :plan_id)
    end
end
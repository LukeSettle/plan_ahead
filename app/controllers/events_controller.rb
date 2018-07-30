class EventsController < ApplicationController
  before_action :find_event, except: [:index, :create, :new]

  def index
    @events = Event.all
  end

  def new
    if params[:found_attributes]
      @event = Event.new(params[:found_attributes])
    else
      @event = Event.new
    end
    @attributes = params[:attributes]
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to plan_path(event_params[:plan_id])
    else
      attributes_not_found = @event.errors.details.select { |_attribute, message| message.first[:error] == :blank }.map(&:first)
      found_attributes = @event.attributes.select { |key, value| value.present? }
      redirect_to new_event_path(plan_id: event_params[:plan_id], attributes: attributes_not_found, event: found_attributes)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(params[:id])
    else
      flash[:alert] = @event.errors if @event.errors.any?
      redirect_to edit_event_path(params[:id])
    end
  end

  def destroy
    @event.destroy
  end

  protected
    def find_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :kind, :price, :link, :starts_at, :ends_at, :plan_id)
    end
end
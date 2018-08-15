class LodgingEventsController < ApplicationController
  before_action :find_lodging_event, except: [:index, :create, :new]

  def index
    @lodging_events = LodgingEvent.all
  end

  def new
    if params[:lodging_event].present?
      @lodging_event = LodgingEvent.new(lodging_event_params)
    else
      @lodging_event = LodgingEvent.new
    end
    @attributes = params[:attributes]
  end

  def create
    @lodging_event = LodgingEvent.new lodging_event_params
    if @lodging_event.save
      redirect_to plan_path(lodging_event_params[:plan_id])
    else
      attributes_not_found = @lodging_event.errors.details.select { |_attribute, message| message.first[:error] == :blank }.map(&:first)
      found_attributes = @lodging_event.attributes.select { |key, value| value.present? }
      redirect_to new_lodging_event_path(plan_id: lodging_event_params[:plan_id], attributes: attributes_not_found, lodging_event: found_attributes)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @lodging_event.update(lodging_event_params)
      redirect_to lodging_event_path(params[:id])
    else
      flash[:alert] = @lodging_event.errors if @lodging_event.errors.any?
      redirect_to edit_lodging_event_path(params[:id])
    end
  end

  def destroy
    @lodging_event.destroy
  end

  protected
    def find_lodging_event
      @lodging_event = LodgingEvent.find(params[:id])
    end

    def lodging_event_params
      params.require(:lodging_event).permit(:title, :price, :price_type, :link, :starts_at, :ends_at, :plan_id, :currency)
    end
end
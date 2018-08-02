class TravelEventsController < ApplicationController
  before_action :find_travel_event, except: [:new, :create]

  def new
    @travel_event = TravelEvent.new
  end

  def show
  end

  def edit
  end

  def create
    @travel_event = TravelEvent.new(travel_event_params)
    if @travel_event.save
      flash[:notice] = t('model.travel_event.created')
      render 'show'
    else
      flash[:alert] = @travel_event.errors.messages
      render 'new'
    end
  end

  def update
    if @travel_event.update(travel_event_params)
      flash[:notice] = t('model.travel_event.updated')
      render 'show'
    else
      flash[:warning] = @travel_event.errors
      render 'edit'
    end
  end

  def destroy
    @travel_event.delete
    render @travel_event.parent_event
  end

  protected
    def travel_event_params
      params.require(:travel_event).permit(:origin, :destination, :mode_of_transportation, :parent_event_id)
    end

    def find_travel_event
      @travel_event = TravelEvent.find(params[:id])
    end
end
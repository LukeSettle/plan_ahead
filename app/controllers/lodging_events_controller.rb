# class ParentEventsController < ApplicationController
#   before_action :find_parent_event, except: [:index, :create, :new]
#
#   def index
#     @parent_events = ParentEvent.all
#   end
#
#   def new
#     if params[:parent_event].present?
#       @parent_event = ParentEvent.new(parent_event_params)
#     else
#       @parent_event = ParentEvent.new
#     end
#     @attributes = params[:attributes]
#   end
#
#   def create
#     @parent_event = ParentEvent.new parent_event_params
#     if @parent_event.save
#       redirect_to plan_path(parent_event_params[:plan_id])
#     else
#       attributes_not_found = @parent_event.errors.details.select { |_attribute, message| message.first[:error] == :blank }.map(&:first)
#       found_attributes = @parent_event.attributes.select { |key, value| value.present? }
#       redirect_to new_parent_event_path(plan_id: parent_event_params[:plan_id], attributes: attributes_not_found, parent_event: found_attributes)
#     end
#   end
#
#   def show
#   end
#
#   def edit
#   end
#
#   def update
#     if @parent_event.update(parent_event_params)
#       redirect_to parent_event_path(params[:id])
#     else
#       flash[:alert] = @parent_event.errors if @parent_event.errors.any?
#       redirect_to edit_parent_event_path(params[:id])
#     end
#   end
#
#   def destroy
#     @parent_event.destroy
#   end
#
#   protected
#     def find_parent_event
#       @parent_event = Event.find(params[:id])
#     end
#
#     def parent_event_params
#       params.require(:parent_event).permit(:title, :kind, :price, :link, :starts_at, :ends_at, :plan_id, :currency)
#     end
# end
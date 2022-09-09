class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @events = Event.all
    @past_events = Event.past
    @future_events = Event.future
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build event_params

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    @event.save
    redirect_to attend_event_path
  end

  def stop_attend
    @event = Event.find(params[:id])
    @event.attendees.destroy current_user.id
    redirect_to attend_event_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end

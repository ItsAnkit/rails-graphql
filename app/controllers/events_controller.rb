class EventsController < ApplicationController
  def index
    events = Event.all.order(:id)
    render json: events, status: :ok
  end

  def create
    @event = Event.find_by(id: event_params[:id])
    status = @event ? :bad_request : save_event
    render json: {}, status: status
  end

  def get_actor
    actor = Actor.find_by(id: params[:id])
    events = {}
    if actor
      events = actor.events.order(:id)
      status = :ok
    else
      status = :not_found
    end
    render json: events, status: status
  end

  def erase
    Event.destroy_all
    render json: {}, status: :ok
  end

  private

  def event_params
    params[:event_type] = params[:type]
    params.permit(:id, :event_type, :created_at)
  end

  def actor_params
    params.require(:actor).permit(:id, :login, :avatar_url)
  end

  def repo_params
    params.require(:repo).permit(:id, :name, :url)
  end

  def save_event
    set_actor
    set_repo
    new_event_params = event_params.merge({actor_id: @actor.id, repo_id: @repo.id})
    Event.create(new_event_params)
    :created
  end

  def set_actor
    @actor = Actor.find_by(id: actor_params[:id])
    unless @actor
      @actor = Actor.create(actor_params)
    end
  end

  def set_repo
    @repo = Repo.find_by(id: repo_params[:id])
    unless @repo
      @repo = Repo.create(repo_params)
    end
  end
end

class ActorsController < ApplicationController

  def index
    actors = Actor.left_joins(:events).group(:id).order("COUNT(events.id) DESC", 
                                                        "MAX(events.created_at) DESC",
                                                        "actors.login ASC")
    render json: actors, status: :ok
  end
  
  def streak
    actors = Actor.left_joins(:events).group(:id).order("actors.streak DESC",
                                                        "MAX(events.created_at) DESC",
                                                        "actors.login ASC"
                                                       )
    render json: actors, status: :ok
  end

  def update_actor
    @actor = Actor.find_by(id: params[:id])
    if @actor
      handle_actor
    else
      @status = :not_found
    end
    render json: {}, status: @status
  end

  private

  def handle_actor
    if @actor.login.eql?(params[:login])
      @actor.update(avatar_url: params[:avatar_url])
      @status = :ok
    else
      @status = :bad_request
    end
  end
end


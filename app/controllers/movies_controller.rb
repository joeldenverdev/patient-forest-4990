class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end

  def update
    if params[:name]
      @actor = Actor.search(params[:name]).first
      ActorMovie.create!(movie_id: params[:id], actor_id: @actor.id)
      redirect_to "/movies/#{params[:id]}"
    end
  end
end

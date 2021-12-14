class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
    # NOTE: Could not quite finish extension.
    # @actors = Actor.other_actors(@actor.name)
    # require 'pry'; binding.pry
  end
end

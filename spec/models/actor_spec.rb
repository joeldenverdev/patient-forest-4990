require 'rails_helper'

RSpec.describe Actor, type: :model do
  before(:each) do
    @studio_1 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_2 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_3 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @movie_1 = @studio_1.movies.create!(title: "True Lies", creation_year: 1995, genre: "Action")
    @movie_2 = @studio_1.movies.create!(title: "Terminator", creation_year: 1990, genre: "Action")
    @movie_3 = @studio_2.movies.create!(title: "Skyfall", creation_year: 2019, genre: "Action")
    @movie_4 = @studio_3.movies.create!(title: "Spectre", creation_year: 2020, genre: "Action")

    @actor_1 = @movie_1.actors.create!(name: "Arnold S.", age: 74)
    @actor_2 = @movie_1.actors.create!(name: "Jamie Lee Curtis", age: 62)
    @actor_3 = @movie_1.actors.create!(name: "Tom Arnold", age: 68)
  end

  describe 'relationships' do
    it { should have_many(:actor_movies) }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe '::order_by_age' do
    it 'returns the actors of a movie from youngest to oldest' do
      actors = [@actor_2, @actor_3, @actor_1]
      expect(@movie_1.actors.order_by_age).to eq(actors)
    end
  end

  describe '::average_age' do
    it 'returns the average age of the actors in the movie' do
      expect(@movie_1.actors.average_age).to eq(68)
    end
  end

  describe '::search' do
    it 'finds an actor by name in the database' do
      expect(Actor.search(@actor_3.name).first.name).to eq("Tom Arnold")
    end
  end

  describe '::other_actors' do
    it 'returns the names of other actors that a particular actor has acted with' do
      actors = [@actor_2, @actor_3]
      expect(Actor.other_actors).to eq(actors)
    end
  end
end

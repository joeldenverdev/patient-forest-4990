require 'rails_helper'

RSpec.describe 'actors show page' do
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

  describe 'when I visit an actors show page' do
    it 'shows the actors name and age' do
      visit "/actors/#{@actor_1.id}"

      expect(page).to have_content(@actor_1.name)
      expect(page).to have_content(@actor_1.age)
    end

    it 'shows the other actors that the actor has worked with' do

    end
  end
end

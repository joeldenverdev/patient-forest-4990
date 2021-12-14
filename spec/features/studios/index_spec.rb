require 'rails_helper'

RSpec.describe 'studios index page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_2 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_3 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @movie_1 = @studio_1.movies.create!(title: "True Lies", creation_year: 1995, genre: "Action")
    @movie_2 = @studio_1.movies.create!(title: "Terminator", creation_year: 1990, genre: "Action")
    @movie_3 = @studio_2.movies.create!(title: "Skyfall", creation_year: 2019, genre: "Action")
    @movie_4 = @studio_3.movies.create!(title: "Spectre", creation_year: 2020, genre: "Action")
  end

  describe 'when I visit the studios index page' do
    it 'shows a list of the studios' do
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_3.name)
    end

    it 'displays the movies which belong to each studio' do
      visit "/studios"

      expect(page).to have_content(@studio_1.movies[0].title)
      expect(page).to have_content(@studio_1.movies[1].title)
      expect(page).to have_content(@studio_2.movies[0].title)
      expect(page).to have_content(@studio_3.movies[0].title)
    end
  end
end

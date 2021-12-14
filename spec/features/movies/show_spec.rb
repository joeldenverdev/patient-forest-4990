require 'rails_helper'

RSpec.describe 'movies show page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_2 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_3 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @movie_1 = @studio_1.movies.create!(title: "True Lies", creation_year: 1995, genre: "Action")
    @movie_2 = @studio_1.movies.create!(title: "Terminator", creation_year: 1990, genre: "Action")
    @movie_3 = @studio_2.movies.create!(title: "Skyfall", creation_year: 2019, genre: "Action")
    @movie_4 = @studio_3.movies.create!(title: "Golden Eye", creation_year: 2008, genre: "Action")

    @actor_1 = @movie_1.actors.create!(name: "Arnold S.", age: 74)
    @actor_2 = @movie_1.actors.create!(name: "Jamie Lee Curtis", age: 62)
    @actor_3 = @movie_1.actors.create!(name: "Tom Arnold", age: 68)
    @actor_4 = @movie_2.actors.create!(name: "Daniel Craig", age: 50)
    @actor_5 = @movie_3.actors.create!(name: "Pierce Brosnan", age: 67)

    visit "movies/#{@movie_1.id}"
  end

  describe 'when I visit the movies show page' do
    it 'shows me the movies title, creation year, and genre' do
      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
    end

    it 'includes a list of actors from youngest to oldest' do
      expect(@actor_2.name).to appear_before(@actor_3.name)
      expect(@actor_3.name).to appear_before(@actor_1.name)
    end

    it 'shows the average age of all the movies actors' do
      expect(page).to have_content("Average Age of Actors: 68")
    end

    it 'does not include actors that arent in this movie' do
      expect(page).to_not have_content(@actor_4.name)
      expect(page).to_not have_content(@actor_5.name)
    end

    it 'has a form to add an actor to the movie' do
      fill_in(:name, with: 'Pierce Brosnan')
      fill_in(:age, with: 90)
      click_button("Submit")

      expect(current_path).to eq("/movies/#{@movie_1.id}")
      expect(page).to have_content("Pierce Brosnan")
    end
  end
end

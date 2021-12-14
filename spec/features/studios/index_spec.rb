require 'rails_helper'

RSpec.describe 'studios index page' do
  before(:each) do
    @studio_1 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_2 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
    @studio_3 = Studio.create!(name: "Colorado Studio", location: "Boulder, Colorado")
  end

  describe 'when I visit the studios index page' do
    it 'shows a list of the studios' do
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_3.name)
    end
  end
end

# As a user,
# When I visit '/books'
# Then I see each book in the system including the book's:
#   - title
#   - number of pages
#   - publication year
#   - the name of each author that wrote the book
require 'rails_helper'

RSpec.describe "Books Index Page" do
  describe "When I visit the books index page" do
    before(:each) do
      @king = Author.create!(name: "Stephen King")
      @koontz = Author.create!(name: "Dean Koontz")
      @straub = Author.create!(name: "Peter Straub")

      @talisman = Book.create!(title: "The Talisman", pages: 944, year: 2012)
      @it = Book.create!(title: "It", pages: 1138, year: 1986)
      @shadow = Book.create!(title: "77 Shadow Street", pages: 556, year: 2011)
      @ghost = Book.create!(title: "Ghost Story", pages: 483, year: 1979)
    end

    it "shows each book in the system with title, pages, publication year, and author" do
      visit "/books"

      within("#author-#{king.id}") do
        expect(page).to have_content(talisman.title)
        expect(page).to have_content(talisman.pages)
        expect(page).to have_content(talisman.year)
        expect(page).to have_content(talisman.author.name)
        expect(page).to have_content(it.title)
        expect(page).to have_content(it.pages)
        expect(page).to have_content(it.year)
        expect(page).to have_content(it.author.name)
      end

      within("#author-#{koontz.id}") do
        expect(page).to have_content(shadow.title)
        expect(page).to have_content(shadow.pages)
        expect(page).to have_content(shadow.year)
        expect(page).to have_content(shadow.author.name)
      end

      within("#author-#{straub.id}") do
        expect(page).to have_content(talisman.title)
        expect(page).to have_content(talisman.pages)
        expect(page).to have_content(talisman.year)
        expect(page).to have_content(talisman.author.name)
        expect(page).to have_content(ghose.title)
        expect(page).to have_content(ghost.pages)
        expect(page).to have_content(ghost.year)
        expect(page).to have_content(ghost.author.name)
      end
    end
  end
end

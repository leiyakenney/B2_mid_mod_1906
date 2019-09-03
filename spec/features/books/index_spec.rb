require 'rails_helper'

RSpec.describe "Books Index Page" do
  describe "When I visit the books index page" do
    before(:each) do
      @king = Author.create!(name: "Stephen King")
      @it = @king.books.create!(title: "It", pages: 1138, year: 1986)
      @koontz = Author.create!(name: "Dean Koontz")
      @shadow = @koontz.books.create!(title: "77 Shadow Street", pages: 556, year: 2011)
      @straub = Author.create!(name: "Peter Straub")
      @ghost = @straub.books.create!(title: "Ghost Story", pages: 483, year: 1979)
    end

    it "shows each book in the system with title, pages, publication year, and author" do
      visit "/books"
      
      within("#book-#{@it.id}") do
        expect(page).to have_content(@it.title)
        expect(page).to have_content(@it.pages)
        expect(page).to have_content(@it.year)
        expect(page).to have_content("Stephen King")
      end

      within("#book-#{@shadow.id}") do
        expect(page).to have_content("Title: #{@shadow.title}")
        expect(page).to have_content("Pages: #{@shadow.pages}")
        expect(page).to have_content("Publication Year: #{@shadow.year}")
        expect(page).to have_content("Author(s): #{@koontz.name}")
      end

      within("#book-#{@ghost.id}") do
        expect(page).to have_content(@ghost.title)
        expect(page).to have_content(@ghost.pages)
        expect(page).to have_content(@ghost.year)
        expect(page).to have_content("Peter Straub")
      end
    end
  end
end

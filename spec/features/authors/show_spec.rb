
# When I click the link
#   Then I am taken to an Author Show Page where I see the author with that id including the author's:
#   - name
#   - the title of each book they have written
#   - the average number of pages for all of their books

require 'rails_helper'

RSpec.describe "Author Show Page" do
  describe "When I click on the Author's link" do
    before(:each) do
      @king = Author.create!(name: "Stephen King")
      @it = Book.create!(title: "It", pages: 1138, year: 1986)
      @shining = Book.create!(title: "The Shining", pages: 447, year: 1977)
      @king.books << @it
      @king.books << @shining
      @koontz = Author.create!(name: "Dean Koontz")
      @shadow = @koontz.books.create!(title: "77 Shadow Street", pages: 556, year: 2011)
      @straub = Author.create!(name: "Peter Straub")
      @ghost = @straub.books.create!(title: "Ghost Story", pages: 483, year: 1979)
    end

    it "takes me to the author show page where I see the author's name, book titles, and average page numbers for all books" do
      visit "/books"
      first(:link, "Stephen King").click

      expect(current_path).to eq("/authors/#{@king.id}")

      expect(page).to have_content("Stephen King")
      expect(page).to have_content("Books: #{@it.title} " "#{@shining.title}")
      expect(page).to have_content("Average Pages: #{@king.avg_pages}")
      expect(page).to have_content("Average Pages: 792.5")

      visit "/books"
      click_link("Dean Koontz")

      expect(page).to have_content("Dean Koontz")
      expect(page).to have_content("Books: #{@shadow.title}")
      expect(page).to have_content("Average Pages: #{@koontz.avg_pages}")

      visit "/books"
      click_link("Peter Straub")

      expect(page).to have_content("Peter Straub")
      expect(page).to have_content("Books: #{@ghost.title}")
      expect(page).to have_content("Average Pages: #{@straub.avg_pages}")
    end
  end
end

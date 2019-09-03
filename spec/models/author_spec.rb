require "rails_helper"

RSpec.describe Author, type: :model do
  describe "relationships" do
    it { should have_many :author_books}
    it { should have_many(:books).through(:author_books)}
  end

  before(:each) do
    @king = Author.create!(name: "Stephen King")
    @it = Book.create!(title: "It", pages: 1138, year: 1986)
    @shining = Book.create!(title: "The Shining", pages: 447, year: 1977)
    @king.books << @it
    @king.books << @shining
  end

  it "test average pages" do
    expect(@king.avg_pages).to eq(792.5)
  end

end

require "bookmark"

describe Bookmark do
  describe "#all" do
    it "returns all urls from bookmarks database table" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(page).to have_content ("http://www.destroyallsoftware.com")
    expect(page).to have_content ("http://www.google.com")
    end
  end
end

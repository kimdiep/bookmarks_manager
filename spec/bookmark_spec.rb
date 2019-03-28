# frozen_string_literal: true

require 'pg'
require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all urls from bookmarks database table' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      #Check bookmark id matches the id of the data persisted in the test database to ensure it is the correct data entry
      expect(bookmarks.first.id).to eq bookmark.first['id']
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'pusheen-test', title: 'Pusheen Title').first
      expect(bookmark['url']).to eq 'pusheen-test'
      expect(bookmark['title']).to eq 'Pusheen Title'
    end
  end
end

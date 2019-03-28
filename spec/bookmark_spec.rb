# frozen_string_literal: true

require 'pg'
require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#all' do
    it 'returns all urls from bookmarks database table' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      # Check bookmark id matches the id of the data persisted in the test database to ensure it is the correct data entry
    end
  end

  describe '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'pusheen-test', title: 'Pusheen Title')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.url).to eq 'pusheen-test'
      expect(bookmark.title).to eq 'Pusheen Title'
    end
  end
end

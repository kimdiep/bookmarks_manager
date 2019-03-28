# frozen_string_literal: true

require 'pg'
require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all urls from bookmarks database table' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES
      ('http://www.makersacademy.com'),
      ('http://www.destroyallsoftware.com'),
      ('http://www.google.com');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end
end

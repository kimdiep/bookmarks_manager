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

  describe '#delete' do
    it 'deletes a specific bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '#update' do
    it 'updates the specific bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.pusheen.com', title: 'Pusheen AGAIN!')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Pusheen AGAIN!'
      expect(updated_bookmark.url).to eq 'http://www.pusheen.com'
    end
  end

  describe '#find' do
    #ORM pattern to wrap the bookmark data in a useful Ruby object.
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      
      # Our user needs to see the current data in the edit form.
      # To do this, we need to pass more than just @bookmark_id to the form. 
      #We need to pass a Bookmark object that wraps the data for that bookmark.
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

end

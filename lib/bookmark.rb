# frozen_string_literal: true

require 'pg'

# Bookmark class
class Bookmark
  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end

    result = connection.exec('SELECT * FROM bookmarks;')
    list = result.map { |bookmark| bookmark['url'] }
    list.join("\n")
  end

  def self.create(url:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end

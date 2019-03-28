# frozen_string_literal: true

require 'pg'

feature 'Bookmarks' do
  scenario 'displays bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES
      (1, 'http://www.makersacademy.com'),
      (2, 'http://www.destroyallsoftware.com'),
      (3, 'http://www.google.com');")

    visit('/bookmarks')
    expect(page).to have_text('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.google.com')
  end
end

# frozen_string_literal: true

feature 'Deleting a bookmark' do
  scenario 'User deletes a bookmark' do
    #
    #   Setting up test data
    #   Checking that the data is present
    #   Carrying out the DELETE action
    #   Checking that the data has been removed
    #
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    # Capybara's first method to click the Delete button inside the first element with class 'bookmark'.
    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end

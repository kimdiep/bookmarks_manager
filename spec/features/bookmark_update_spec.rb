# frozen_string_literal: true

feature 'Bookmark Update' do
  scenario 'User updates a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Edit'

    # Sinatra named parameters for this route: visiting /bookmarks/1/edit will allow the user to update a bookmark with an ID of 1 etc.
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: 'http://www.pusheen.com')
    fill_in('title', with: 'Pusheen AGAIN!')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Pusheen AGAIN!', href: 'http://www.pusheen.com')
  end
end

# frozen_string_literal: true

feature 'Bookmarks' do
  scenario 'displays bookmarks' do
    visit('/bookmarks')
    expect(page).to have_text('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.google.com')
  end
end

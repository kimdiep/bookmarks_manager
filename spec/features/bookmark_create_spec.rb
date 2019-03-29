# frozen_string_literal: true

feature 'New bookmark' do
  scenario 'User adds new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.pusheen.com')
    fill_in('title', with: 'Pusheen Title')
    click_button('Submit')

    expect(page).to have_link('Pusheen Title', href: 'https://www.pusheen.com')
  end

  scenario 'Validation - The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'invalid url')
    click_button('Submit')
  
    expect(page).not_to have_content "invalid url"
    expect(page).to have_content "This is an invalid URL."
  end

end

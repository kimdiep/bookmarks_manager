# frozen_string_literal: true

feature 'New bookmark' do
  scenario 'User adds new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'pusheen-test')
    fill_in('title', with: 'Pusheen Title')
    click_button('Submit')

    expect(page).to have_link('Pusheen Title', href: 'pusheen-test')
  end
end

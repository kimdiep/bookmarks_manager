# frozen_string_literal: true

feature 'New bookmark' do
  scenario 'User adds new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'pusheen-test')
    click_button('Submit')

    expect(page).to have_content('pusheen-test')
  end
end

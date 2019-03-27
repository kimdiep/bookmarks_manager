## 01. Creating User Stories

https://github.com/makersacademy/course/blob/master/bookmark_manager/01_creating_user_stories.md

### Specification: List of requirements

- Show a list of bookmarks
- Add new bookmarks
- Delete bookmarks
- Update bookmarks
- Comment on bookmarks
- Tag bookmarks into categories
- Filter bookmarks by tag
- Users manage their bookmarks


### High-Level Sketch of the Domain Model

![domain model](./public/images/bookmarks_domain_model.png)

---

### User Story 1 

> As a user
So that I can go to web sites I regularly visit
I would like to view a list of bookmarks


- Controller
- Bookmark class
- Bookmark view

---

## 02. Setting up the web project

- This is a Ruby web project, applying the Sinatra framework and using Sinatra::Base to follow the modular form of Sinatra

Testing Infrastructure:

- Capybara
- Rspec

- First, we set up the project with Sinatra with RSpec and Capybara and tested that the infrastructure is up and running
- Using a feature test, we made sure that the simple index page for your bookmark manager is showing
- Rubocop is applied as a linter
- SimpleCov is applied to show the test coverage metric
- Rackup is used to run the server

https://github.com/makersacademy/course/blob/master/pills/ruby_web_project_setup_list.md

---

## 03. Viewing Bookmarks

https://github.com/makersacademy/course/blob/master/bookmark_manager/03_viewing_bookmarks.md










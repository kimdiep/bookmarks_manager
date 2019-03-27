## 01. Creating User Stories

https://github.com/makersacademy/course/blob/master/bookmark_manager/01_creating_user_stories.md

### Specification: List of requirements

Here we are practising CRUD on the database

`Show` (read) a list of bookmarks
`Add` (create) new bookmarks
`Delete` (delete) bookmarks
`Update` (update) bookmarks
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

Made some notes on RESTful routes. A RESTful route provides a mapping between HTTP verbs, controller actions, and (implicitly) CRUD operations in a database.

- Applying MVC to push the heavy logic to the model

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |

The controller–view interaction follows the MVC convention. 
The controller combines data (the bookmarks) with the view (an erb template) to follow REST.

e.g. 

```ruby
 get '/bookmarks' do
    @bookmarks = Bookmark.all
    #The controller combines data (the bookmarks) with the view (an erb template).
    erb :"bookmarks/index"
  end

```

- The controller-model interaction also follows the MVC convention. 
- The controller gets data (the bookmarks) from the model.


- The controller is like an integration test :) - we are making sure that the model layer, controller layer and view layers integrate well with one another :)

- We want a method to retrieve the bookmarks from the Bookmark class. Don't want to create a new instance of a bookmark just yet.

- The feature test for viewing bookmarks and the unit test for Bookmark are very similar which is a good sign.
- presenting Bookmark data to two different interfaces (feature test presents to the browser interface, unit test presents to the controller interface)

---









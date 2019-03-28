## 01. Creating User Stories

https://github.com/makersacademy/course/blob/master/bookmark_manager/01_creating_user_stories.md

### Specification: List of requirements

Here we are practising CRUD on the database

[X] `Show` (read) a list of bookmarks
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

## 04. Setting up a Database

https://github.com/makersacademy/course/blob/master/bookmark_manager/04_setting_up_a_database.md

- Our aim is to get the hard-coded data to read from a database (persist bookmarks across interactions.)
- We used `PostgreSQL` (a database management system), a server that runs a database.
- We can use `pSQL` to create a new database.


---

## 05. Creating your first table

https://github.com/makersacademy/course/blob/master/bookmark_manager/05_creating_your_first_table.md

Use psql to create a table called `bookmarks` in the `bookmark_manager` database, with two columns:
- `id`, a SERIAL PRIMARY KEY
- `url`, a VARCHAR with a maximum length of 60.

```
bookmarks table

  id | url
-----|----------

```

## Creating bookmark_manager database

1. Connect to psql in terminal `psql postgres`
2. Enter `CREATE DATABASE bookmark_manager;` command to create a new database called bookmark_manager

## Creating bookmarks table on the bookmark_manager database

1. Enter `\c bookmark_manager;` to connect to the database
2. Create `bookmarks` table by running the sql script `01_create_bookmarks_table.sql`
3. Run in pSQL by doing `\i db/migrations/01_create_bookmarks_table.sql;` from the root directory of the repository

---

## 06. Manipulating Table Data

https://github.com/makersacademy/course/blob/master/bookmark_manager/06_manipulating_table_data.md

- Use SQL to create, read (query), update and delete (CRUD) data in the table, inside PostgreSQL database `bookmark_manager`

## Adding example bookmark entries into bookmarks table

1. Use `\i db/migrations/02_add_bookmark_entries.sql;` to execute the SQL script to add bookmark entries to the bookmarks table in the `bookmark_manager` database

---
## 07. Interacting with PostgreSQL from Ruby

https://github.com/makersacademy/course/blob/master/bookmark_manager/07_interacting_with_postgres_from_ruby.md

- We are using the pg rubygem to get the application and database talking to each other
https://bitbucket.org/ged/ruby-pg/wiki/Home

```ruby
=begin
The pg gem makes a PG object available in Ruby.
We can call connect on the PG object, passing in the database name.
This will return an object that we can send a query to, let's call that object connection.
To retrieve bookmarks from the database, we'll call exec on the connection object, passing in a query string.
=end

#Require the PG gem
require 'pg'

class Bookmark
  #This is the class method
  #Retrieve data from the database
  def self.all
    #Establish connection with 'bookmark_manager' database, we connect on the PG object and pass in the db name
    connection = PG.connect( dbname: 'bookmark_manager' )
    #exec method submits an SQL command to the server and waits for the result
    #We can query on the PG object and we call that object the object connection
    #The SQL command will select all from bookmarks table
    result = connection.exec( "SELECT * FROM bookmarks;" )
    #All result rows and columns are stored in a memory block attached to the PG::Result object
    #We can map this onto an array and then format the output
    list = result.map { |bookmark| bookmark['url'] }
    list.join("\n")
  end
end

```

---

## 08. Upgrading your toolset

https://github.com/makersacademy/course/blob/master/bookmark_manager/08_upgrading_your_toolset.md

Upgrade our tooling so we can see what's going on in our database more easily.
Add the 'create new bookmarks' feature to our application using the pg gem.
Refactor all the complicated SQL in our Bookmark model using an Object-Relational Map.

---

## 09. Setting up a test environment

 - Script to reset your database every time tests are run. 
 - Build a test environment for web application.

https://github.com/makersacademy/course/blob/master/bookmark_manager/09_setting_up_a_testing_environment.md

- When we run our server using rspec, the ENV['ENVIRONMENT'] variable is set to 'test', and our Bookmark class connects to bookmark_manager_test.
- When we run our server in any other way, the ENV['ENVIRONMENT'] variable is not set, and our Bookmark class connects to bookmark_manager.

---

## 10. Creating Bookmarks

https://github.com/makersacademy/course/blob/master/bookmark_manager/10_creating_bookmarks.md

- Add new bookmarks
- 'adding bookmarks to the database' from browser to database: across the whole stack.

> User Story:
> As a user, 
> I must be able to add bookmarks to the app 
> so that I can log my favourite bookmarks to see later on

- This is RESTful route, so at this step it's sensible to factor this into the Sinatra routing

- HTTP VERB: POST request 
- URI: /bookmarks         
- Controller#action: bookmarks#create

- HTTP VERB: POST-REDIRECT LOOP redirected to a GET route
- The following URI pattern to be used: /bookmarks/new
- Controller#action: bookmarks#new

- 1. The user will go to /bookmarks/new
- 2. They will add a url to a form, they will click 'Submit'
- 3. They can view the bookmark (database updated)

- The form data will be submitted to a different route in Sinatra for saving to the database.
















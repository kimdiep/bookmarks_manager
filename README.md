Bookmarks Manager
=================

## Project Overview

**To build a web app that stores web bookmarks in a database.**


- A bookmark manager is a website to maintain a collection of bookmarks (URLs). 
- You can use it to save a webpage you found useful. 
- You can add tags to the webpages you saved to find them later. 
- You can browse bookmarks other users have added. 
- You can comment on the bookmarks.


## For this project, we are targetting the following goals:

- Can you build a web app that uses a database?
- Agile and TDD
- Engineering and 'Dev Recipes'
- Databases
- Tooling

For the test-driven development, we will be using the **Behaviour Driven Development (BDD) cycle** (i.e. outside-in testing: Capybara first).

---

### High-Level Sketch of the Domain Model

![domain model](./public/images/bookmarks_domain_model.png)

---

## Database setup instructions

### Creating bookmark_manager database

1. Connect to psql in terminal `psql postgres`
2. Enter `CREATE DATABASE bookmark_manager;` command to create a new database called bookmark_manager

### Creating bookmarks table on the bookmark_manager database

1. Enter `\c bookmark_manager;` to connect to the database
2. Create `bookmarks` table by running the sql script `01_create_bookmarks_table.sql`
3. Run in pSQL by doing `\i db/migrations/01_create_bookmarks_table.sql` from the root directory of the repository

### Creating a test database

1. Enter `psql` to connect to the database server
2. `CREATE DATABASE "bookmark_manager_test";` will create a test database
3. Run the SQL script `\i db/migrations/01_create_bookmarks_table.sql;` to create an empty bookmarks table in the test database
4. Ensure you include `ENV['ENVIRONMENT'] = 'test'` in your `spec_helper.rb` file and check that the bookmark class is pointing to the correct database
5. 

```ruby

# Set to test environment
ENV['ENVIRONMENT'] = 'test'

# Configuration of test db
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end


```




### Creating a db backup
- In terminal to create your backup db

`pg_dump --file=backup_db.sql bookmark_manager`

-- below for user to make the db --
load up psql in terminal (load it up when you are in the directory where you saved the sql file)

`CREATE DATABASE bookmark_manager`
`\c bookmark_manager`
`\i backup_db.sql`

User now has a carbon copy of the DB you made



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

require './lib/database_connection'

#The db connection is set up with this script when the application boots (app.rb)

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end
require 'database_connection'

# This tests the simple wrapper for the method PG.connect.
#We're expecting PG to receive connect with the test db.
#The simple wrapper will be a class method called setup, on an object called `DatabaseConnection`.

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a connection to the database through PG gem - object' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end


    it 'checks that the connection is persistent' do
      # Grab the connection as a return value from the .setup method
      connection = DatabaseConnection.setup('bookmark_manager_test')
  
      #Connection is another class method
      expect(DatabaseConnection.connection).to eq connection
    end

  end

  describe '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
  
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
  
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end

end
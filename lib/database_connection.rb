require 'pg'

class DatabaseConnection
  # This is a simple wrapper for the method PG.connect.
  # It is a class method
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.connection
    @connection
  end
  
  def self.query(sql)
    @connection.exec(sql)
  end

end

=begin
We're using a class instance variable `@connection` to store the connection, combined with `self.connection`.
We can do this because our DatabaseConnection is never going to be instantiated. 
It's a 'Singleton' object: there's only one DatabaseConnection in the application.
=end
# DB CONNECTION CLASS
# 1. connect() => Connects to a database if it doesn't exist
# 2. create_db() => Creates a table if it doesn't exist
# 3. select() => Retrieves data from db
# 4. insert() => Inserts data into db

class ConnectionSQLite
  attr_reader :db
  @db_path = "../../db/db.sql"

  def self.connect
	# Connect to the database if not already connected
	puts "Connecting to database..."
	@db ||= SQLite3::Database.new(@db_path) 
  end

  # create a new table if it does not exist
  def self.create_db(table_name)
	puts "Creating a db and table #{table_name}..."
	@db.execute <<-SQL
		CREATE TABLE IF NOT EXISTS #{table_name} (
			id INTEGER PRIMARY KEY AUTOINCREMENT,
			firstname VARCHAR(30),
			lastname VARCHAR(30),
			age INTEGER,
			email VARCHAR(30),
			password VARCHAR(30)
		);
		SQL
  end

  def self.select(query) # retrieve data from db
	puts "Retrieving data from database..."
	@db.execute(query)
  end 

  def self.insert(query) # insert query to db
	puts "Inserting the user into database..."
	@db.execute(query)
  end
  
  def self.update(query) # insert query to db
	puts "Updating user info..."
	@db.execute(query)
  end
end
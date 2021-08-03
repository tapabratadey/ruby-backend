require "sqlite3"
require_relative "../db_model/db_connect"

# USER MODEL
# 1. Constructor initializes the class attributes
# 2. Create method creates a new user in the database
# 3. Get method returns a user from the database
# 4. All method returns all users from the database
# 5. Update method updates a user in the database
# 6. Destroy method deletes a user from the database

class User
	attr_reader :id, :firstname, :lastname, :age, :email, :password

	@table_name = "users"
	def initialize(arr)
		@id 		= arr[0]
		@firstname 	= arr[1]
		@lastname 	= arr[2]
		@age 		= arr[3]
		@email 		= arr[4]
		@password 	= arr[5]
	end

	def self.init(user_info)
		@firstname 	= user_info[:firstname]
		@lastname 	= user_info[:lastname]
		@age 		= user_info[:age]
		@email 		= user_info[:email]
		@password 	= user_info[:password]
	end

	def to_hash
		{
			id: 		@id,
			firstname: 	@firstname,
			lastname: 	@lastname,
			age: 		@age,
			email: 		@email,
			password: 	@password
		}
	end

	def inspect
		str = "<User: "
		str += "id: #{@id}, "
		str += "firstname: #{@firstname}, "
		str += "lastname: #{@lastname}, "
		str += "age: #{@age}, "
		str += "email: #{@email}, "
		str += "password: #{@password}>"
	end

	def self.create(user_info)
		ConnectionSQLite.create_db(@table_name) # create the database if it doesn't exist
		puts "Creating a new user..."
		init(user_info) # initialize the class attributes
		insert_query = <<-SQL
			INSERT INTO #{@table_name} (firstname, lastname, age, email, password)
			VALUES ("#{@firstname}", "#{@lastname}", "#{@age}", "#{@email}", "#{@password}");
		SQL
		ConnectionSQLite.insert(insert_query) # insert the user into the database
	end

	def self.get(user_id)
		select_query = <<-SQL
			SELECT * FROM #{@table_name}
			WHERE id = #{user_id};
		SQL
		rows = ConnectionSQLite.select(select_query)
		if rows.size > 0
			User.new(rows[0])
		else
			nil
		end
	end

	def self.all
		select_query = <<-SQL
			SELECT * FROM #{@table_name};
		SQL
		rows = ConnectionSQLite.select(select_query)
		if rows.size > 0
			rows.map { |row| User.new(row) }
		else
			[]
		end
	end
	
	def self.update(user_id, attribute, value)
		select_query = <<-SQL
			UPDATE #{@table_name}
			SET #{attribute} = "#{value}"
			WHERE id = #{user_id};
		SQL
		ConnectionSQLite.update(select_query)
	end

	def self.destroy(user_id)
		select_query = <<-SQL
			DELETE FROM #{@table_name}
			WHERE id = #{user_id};
		SQL
		ConnectionSQLite.update(select_query)
	end 
end


# 1. Connect to the database
# 2. Create a new user
# 3. Get a user
# 4. Get all users
# 5. Update a user
# 6. Destroy a user


def main()
	# connect to the database
	# ConnectionSQLite.connect # move to app.rb

	# User.create(firstname: "John", lastname: "Doe", age: "100", email: "johndoe@example.com", password: "test")
	# User.create(firstname: "Tapa", lastname: "Doe", age: "100", email: "johndoe@example.com", password: "test")
	# User.create(firstname: "Yolo", lastname: "Doe", age: "100", email: "johndoe@example.com", password: "test")
	# p User.get(1)
	# p User.all
	# User.update(1, "firstname", "Tapa")
	# User.destroy(1)
	# p User.all
end

# main()
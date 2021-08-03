=begin

=end

class User
	def initialize(user_info)
		@first_name = user_info[:first_name]
		@last_name = user_info[:last_name]
		@age = user_info[:age]
		@email = user_info[:email]
		@password = user_info[:password]
	end

	def create(user_info)
	end

	def get(user_id)
	end

	def all
	end
	
	def update(user_id, attribute, value)
	end

	def destroy(user_id)
	end 
end





def main()
	user1 = User.new(first_name: "John", last_name: "Doe", age: "100", email: "johndoe@example.com", password: "test")
	puts user1.first_name
end

main()
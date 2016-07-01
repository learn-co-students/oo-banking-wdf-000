class BankAccount

	attr_reader :name , :balance , :status

	def initialize (name)
		@name = name
		@status = "open"
		@balance = 1000
	end
	def deposit(amount)
		@balance += amount
	end

	def balance= ( balance )
		@balance = balance
		@status = "closed" if @balance == 0
	end

	def status= (status)
		@status = status
	end

	def display_balance
		"Your balance is $" + @balance.to_s + "."
	end

	def valid?
		if (@status == "open" )
			return true
		else
			return false
		end
	end
	
	def close_account
		@status = "closed"
	end
end

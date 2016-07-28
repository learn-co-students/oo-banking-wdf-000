require 'pry'

class BankAccount

	attr_accessor :balance, :status
	attr_reader :name
	#can't change its name

	def initialize(name)
		#when I initialize the bank account I need to do so with my name
		#always initialize with a balance of 1000
		@name = name
		@balance = 1000 
		@status = "open"
	end

	def deposit(amount)
		self.balance += amount

		#I want to find out what the balance argument I passed here equals
	end

	def display_balance
		"Your balance is $#{self.balance}."
	end

	def valid?
	# if status is open  && the balance > 0
	# if self.status == "open" && self.balance > 0 
	# 	true
	# else
	# 	false
	# end
		self.status == "open" && self.balance > 0 ? true : false
			# binding.pry
	end

	def close_account
		self.status = "closed"
	end



end
